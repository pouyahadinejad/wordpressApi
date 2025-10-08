extension ExtString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

// NABEGHEHA.COM
  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");
    return passwordRegExp.hasMatch(this);
  }

  String get removeAllHtmlTags {
    RegExp exp = RegExp(
      r"<[^>]*>|\n",
      multiLine: true,
      caseSensitive: true,
    );
    String text = this;
    return text.replaceAll(exp, '');
  }
}

extension FarsiNumberExtension on String {
  String get farsiNumber {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
    String text = this;
    for (int i = 0; i < english.length; i++) {
      text = text.replaceAll(english[i], farsi[i]);
    }
    return text;
  }
  // NABEGHEHA.COM
}
