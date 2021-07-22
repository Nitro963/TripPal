import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:get/get.dart';

String? validateEmail(val) {
  if (val.isEmpty) return 'Please enter your Email Address'.tr;
  if (!GetUtils.isEmail(val)) return 'Please enter a valid Email Address!'.tr;
  return null;
}

String? validatePassword(String? val) =>
    val!.length < 8 ? 'Please enter a password 8+ chars long'.tr : null;
