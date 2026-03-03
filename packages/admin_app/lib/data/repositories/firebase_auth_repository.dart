import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared/domain/models/app_user.dart';
import 'package:shared/domain/repositories/repositories.dart';

class FirebaseAuthRepository implements AuthRepository {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;

  FirebaseAuthRepository({
    FirebaseAuth? auth,
    GoogleSignIn? googleSignIn,
    FirebaseFirestore? firestore,
  }) : _auth = auth ?? FirebaseAuth.instance,
       _googleSignIn = googleSignIn ?? GoogleSignIn.instance,
       _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Stream<AppUser?> get authStateChanges {
    return _auth.authStateChanges().asyncMap((user) async {
      if (user == null) return null;
      // Fetch role from firestore or default to admin for now
      final doc = await _firestore.collection('users').doc(user.uid).get();
      String role = 'admin'; // Forcing admin for this app as requested
      if (doc.exists && doc.data()!.containsKey('role')) {
        role = doc.data()!['role'] as String;
      }
      return AppUser(
        id: user.uid,
        email: user.email!,
        displayName: user.displayName,
        photoUrl: user.photoURL,
        role: role,
      );
    });
  }

  @override
  Future<AppUser?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;
      final authHeaders = await googleUser.authorizationClient
          .authorizationHeaders(['email', 'profile'], promptIfNecessary: true);

      final accessToken = authHeaders?['Authorization']?.replaceAll(
        'Bearer ',
        '',
      );

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      final user = userCredential.user;

      if (user != null) {
        // Create or update user in Firestore
        final userDoc = _firestore.collection('users').doc(user.uid);
        final docSnapshot = await userDoc.get();

        String role = 'admin';
        if (docSnapshot.exists && docSnapshot.data()!.containsKey('role')) {
          role = docSnapshot.data()!['role'] as String;
        }

        await userDoc.set({
          'email': user.email,
          'displayName': user.displayName,
          'photoUrl': user.photoURL,
          'role': role,
          'lastLogin': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));

        return AppUser(
          id: user.uid,
          email: user.email!,
          displayName: user.displayName,
          photoUrl: user.photoURL,
          role: role,
        );
      }
      return null;
    } catch (e) {
      throw Exception('Fallo al iniciar sesión con Google: $e');
    }
  }

  @override
  Future<void> signOut() async {
    await Future.wait([_googleSignIn.signOut(), _auth.signOut()]);
  }
}
