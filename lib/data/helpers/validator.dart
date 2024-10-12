class Validator {
  Validator();

  String? email(String? value) {
    String pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Email field cannot be empty';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid email address (e.g., name@example.com)';
    } else {
      return null;
    }
  }

  String? password(String? value) {
    String pattern = r'^.{6,}$'; // Requires at least 6 characters
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Password field cannot be empty';
    }
    if (!regex.hasMatch(value)) {
      return 'Password must be at least 6 characters long';
    } else {
      return null;
    }
  }

  String? name(String? value) {
    String pattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Name field cannot be empty';
    }
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid name';
    } else {
      return null;
    }
  }
}
