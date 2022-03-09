import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_font_icons/flutter_font_icons.dart';

import '../../utils/validators.dart';
import '../../values/decorations.dart';

class EmailField extends StatelessWidget {
  const EmailField(
      {Key? key,
      this.controller,
      this.onChanged,
      this.errorText,
      this.hintText = 'Email'})
      : super(key: key);

  final TextEditingController? controller;
  final void Function(String? value)? onChanged;
  final String? errorText;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      keyboardType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[^\s]+(\s+[^\s]+)*'))
      ],
      decoration: Decorations.kCredentialsInputDecorations.copyWith(
        errorText: errorText,
        hintText: hintText,
        prefixIcon: const Icon(
          Ionicons.at,
          color: Colors.white,
        ),
      ),
      onChanged: onChanged,
      controller: controller,
      validator: Validators.validateEmail,
    );
  }
}
