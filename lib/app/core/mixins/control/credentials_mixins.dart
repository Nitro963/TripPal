import 'package:flutter/material.dart';

mixin PasswordFieldControlMixin {
  set passwordErrorText(String? value);

  set showPassword(bool value);

  bool get showPassword;

  final TextEditingController passwordFieldController = TextEditingController();

  void toggleShowPassword() {
    showPassword = !showPassword;
  }

  void clearPasswordError() {
    passwordErrorText = null;
  }
}

mixin EmailFieldControlMixin {
  set emailErrorText(String? value);

  final TextEditingController emailFieldController = TextEditingController();

  void clearEmailError() {
    emailErrorText = null;
  }
}
