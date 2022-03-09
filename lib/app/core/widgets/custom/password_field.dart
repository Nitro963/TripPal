import 'package:flutter/material.dart';

import '../../utils/validators.dart';
import '../../values/decorations.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    Key? key,
    this.controller,
    this.onChanged,
    this.errorText,
    this.showPassword = false,
    this.hintText,
  }) : super(key: key);

  final TextEditingController? controller;
  final void Function(String? value)? onChanged;
  final String? errorText;
  final String? hintText;
  final bool showPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      obscureText: !showPassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: Decorations.kCredentialsInputDecorations.copyWith(
        hintText: hintText,
        errorText: errorText,
        prefixIcon: const Icon(
          Icons.lock_outlined,
          color: Colors.white,
        ),
      ),
      controller: controller,
      validator: Validators.validatePassword,
    );
  }
}
