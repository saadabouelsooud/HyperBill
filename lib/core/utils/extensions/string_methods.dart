extension StringMethods on String {
  bool isNumeric() {
    if (this == null) {
      return false;
    }
    return double.parse(this) != null;
  }
  bool isEmail() {
    RegExp regExpEmail = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (this == null || this.trim().isEmpty) {
      return false;
    }
    return regExpEmail.hasMatch(this);
  }
  bool isHaveSmallAndLargeLetter() {
    if (this == null || this.trim().isEmpty||this==this.toLowerCase()||this==this.toUpperCase()) {
      return false;
    }
    return true;
  }

  bool isPassword() {
    RegExp regExpEmail =
    RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$");
    if (this == null || this.trim().isEmpty||this.length < 7) {
      return false;
    }
    return regExpEmail.hasMatch(this);
  }
}
