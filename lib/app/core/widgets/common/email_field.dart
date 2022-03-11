import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_font_icons/flutter_font_icons.dart';

import '../../utils/validators.dart';

class EmailField extends StatelessWidget {
  const EmailField(
      {Key? key,
      this.controller,
      this.onChanged,
      this.errorText,
      this.labelText = 'Email'})
      : super(key: key);
  final TextEditingController? controller;
  final void Function(String? value)? onChanged;
  final String? errorText;
  final String? labelText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      validator: Validators.validateEmail,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[^\s]+(\s+[^\s]+)*'))
      ],
      decoration: InputDecoration(
        prefixIcon: const Icon(Ionicons.at_sharp),
        hintText: 'user@example.com',
        labelText: labelText,
        errorText: errorText,
      ),
    );
  }
}
