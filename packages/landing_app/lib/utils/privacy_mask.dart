class PrivacyMask {
  static String maskName(String fullName) {
    if (fullName.isEmpty) return '';
    final words = fullName.trim().split(RegExp(r'\s+'));
    if (words.isEmpty) return '';

    final maskedWords = words.map((word) {
      if (word.length <= 2) return word;
      final firstPart = word.substring(0, 3);
      final maskedPart = '*' * (word.length - 3 < 1 ? 2 : word.length - 3);
      return '$firstPart$maskedPart';
    }).toList();

    return maskedWords.join(' ');
  }
}
