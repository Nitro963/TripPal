import 'package:travel_app/scr/shared/Constants/constants.dart';
bool isNumeric (String val)
{
  if(val==null) return false;
  return double.tryParse(val) !=null;
}
String validatePassword(val) =>
    val.length < 8 ? 'Please enter a password 8+ chars long' : null;

String validateEmail(val) {
  if (val.isEmpty) return 'Please enter your Email Address';
  if (!emailRegExp.hasMatch(val)) return 'Please enter a valid Email Address!';
  return null;

}

String validateCity(val)=> val.isEmpty ||isNumeric(val[0].toString())? 'unvalid city' :null;
