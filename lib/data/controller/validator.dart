class Validator {
  String? emailValidator(String? value) {
    final emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');

    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }
   String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter password';
    } else if (value.length < 8) {
      return 'Min 8 chars';
    } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return '1 uppercase needed';
    } else if (!RegExp(r'[a-z]').hasMatch(value)) {
      return '1 lowercase needed';
    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
      return '1 number needed';
    } else if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
      return '1 special char needed';
    }
    return null;
  }
}
