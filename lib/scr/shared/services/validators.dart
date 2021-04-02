import 'package:travel_app/scr/shared/Constants/constants.dart';

String validatePassword(val) =>
    val.length < 8 ? 'Please enter a password 8+ chars long' : null;

String validateEmail(val) {
  if (val.isEmpty) return 'Please enter your Email Address';
  if (!emailRegExp.hasMatch(val)) return 'Please enter a valid Email Address!';
  return null;
}
