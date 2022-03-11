import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

import '../../utils/validators.dart';
import '../../values/colors.dart';
import '../../values/decorations.dart';

class PasswordFieldAlt extends StatelessWidget {
  const PasswordFieldAlt({
    Key? key,
    this.controller,
    this.onChanged,
    this.errorText,
    this.showPassword = false,
    this.hintText,
    this.onSuffixIconPressed,
  }) : super(key: key);

  final TextEditingController? controller;
  final void Function(String? value)? onChanged;
  final void Function()? onSuffixIconPressed;
  final String? errorText;
  final String? hintText;
  final bool showPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: AppColors.pureWhite),
      obscureText: !showPassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: Decorations.kCredentialsInputDecorations.copyWith(
        hintText: hintText,
        errorText: errorText,
        suffixIcon: InkWell(
          onTap: onSuffixIconPressed,
          child: Icon(
            showPassword
                ? MaterialCommunityIcons.eye_off_outline
                : MaterialCommunityIcons.eye,
            color: AppColors.pureWhite,
          ),
        ),
        prefixIcon: const Icon(
          Icons.lock_outlined,
          color: AppColors.pureWhite,
        ),
      ),
      controller: controller,
      validator: Validators.validatePassword,
    );
  }
}

class PasswordConfirmationFieldAlt extends StatelessWidget {
  const PasswordConfirmationFieldAlt(
      {Key? key,
      this.password,
      this.controller,
      this.onChanged,
      this.errorText,
      this.showPassword = false,
      this.onSuffixIconPressed,
      this.hintText = 'Confirm Password',
      this.decoration})
      : super(key: key);

  final String? password;
  final TextEditingController? controller;
  final void Function(String? value)? onChanged;
  final void Function()? onSuffixIconPressed;
  final String? errorText;
  final String? hintText;
  final bool showPassword;
  final InputDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: AppColors.pureWhite),
      controller: controller,
      onChanged: onChanged,
      obscureText: !showPassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (val) => password != null
          ? Validators.validateConfirmPassword(val, password!)
          : null,
      decoration: Decorations.kCredentialsInputDecorations.copyWith(
        prefixIcon: const Icon(
          Icons.lock_outlined,
          color: AppColors.pureWhite,
        ),
        suffixIcon: InkWell(
          onTap: onSuffixIconPressed,
          child: Icon(
              showPassword
                  ? MaterialCommunityIcons.eye_off_outline
                  : MaterialCommunityIcons.eye,
              color: AppColors.pureWhite),
        ),
        errorText: errorText,
        hintText: hintText,
      ),
    );
  }
}
