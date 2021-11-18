import 'dart:core';

class Validate {
  static String? emailValidator(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  static String? phoneValidator(String value) {
    if (value.length != 10 || num.tryParse(value) == null) {
      return 'Phone number should contains 10 digits';
    } else {
      return null;
    }
  }

  static String? ageValidator(String value) {
    if (value.length > 2 || num.tryParse(value) == null) {
      return 'Invalid';
    } else {
      return null;
    }
  }

  static String? AdpwdValidator(String value) {
    if (value.toString() != "admin@123") {
      return "Password doesn't match ";
    } else {
      return null;
    }
  }

  static String? txtValidator(String value) {
    if (value.length == 0) {
      return 'field required';
    } else {
      return null;
    }
  }

  static String? pwdValidator(String value) {
    if (value.length < 6) {
      return 'field required';
    } else {
      return null;
    }
  }

  static String? payValidator(String value) {
    if (value.length < 2 || num.tryParse(value) == null) {
      return 'Invalid';
    } else {
      return null;
    }
  }
}
