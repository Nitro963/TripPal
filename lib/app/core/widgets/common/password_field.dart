import 'package:flutter/material.dart';

import 'package:flutter_font_icons/flutter_font_icons.dart';

import '../../utils/validators.dart';

class PasswordField extends StatelessWidget {
  const PasswordField(
      {Key? key,
      this.controller,
      this.onChanged,
      this.errorText,
      this.showPassword = false,
      this.onSuffixIconPressed,
      this.labelText = 'Password'})
      : super(key: key);
  final TextEditingController? controller;
  final void Function(String? value)? onChanged;
  final void Function()? onSuffixIconPressed;
  final String? errorText;
  final String? labelText;
  final bool showPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      obscureText: !showPassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: Validators.validatePassword,
      decoration: InputDecoration(
        prefixIcon: const Icon(FontAwesome.lock),
        suffixIcon: InkWell(
          onTap: onSuffixIconPressed,
          child: Icon(showPassword
              ? MaterialCommunityIcons.eye_off_outline
              : MaterialCommunityIcons.eye),
        ),
        errorText: errorText,
        labelText: labelText,
      ),
    );
  }
}

class PasswordConfirmationField extends StatelessWidget {
  const PasswordConfirmationField(
      {Key? key,
      required this.password,
      this.controller,
      this.onChanged,
      this.errorText,
      this.showPassword = false,
      this.onSuffixIconPressed,
      this.labelText = 'Confirm Password',
      this.decoration})
      : super(key: key);

  final String password;
  final TextEditingController? controller;
  final void Function(String? value)? onChanged;
  final void Function()? onSuffixIconPressed;
  final String? errorText;
  final String? labelText;
  final bool showPassword;
  final InputDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      obscureText: !showPassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (val) => Validators.validateConfirmPassword(val, password),
      decoration: InputDecoration(
        prefixIcon: const Icon(FontAwesome.lock),
        suffixIcon: InkWell(
          onTap: onSuffixIconPressed,
          child: Icon(showPassword
              ? MaterialCommunityIcons.eye_off_outline
              : MaterialCommunityIcons.eye),
        ),
        errorText: errorText,
        labelText: labelText,
      ),
    );
  }
}
