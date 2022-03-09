import 'package:flutter/material.dart';

import 'package:flutter_font_icons/flutter_font_icons.dart';

class VerificationCodeField extends StatelessWidget {
  const VerificationCodeField({
    Key? key,
    this.controller,
    this.labelText = 'Verification Code',
    this.codeLength = 4,
  }) : super(key: key);
  final TextEditingController? controller;
  final String? labelText;
  final int? codeLength;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      maxLength: codeLength,
      decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: const Icon(MaterialCommunityIcons.shield_account)),
    );
  }
}
