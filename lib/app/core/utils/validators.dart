import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' hide Trans;

import '../../../generated/locale_keys.g.dart';

abstract class Validators {
  static String? validateName(val) {
    return (val?.length ?? 0) > 32
        ? LocaleKeys.validators_long_name.tr(args: ['32'])
        : null;
  }

  static String? validateEmail(val) {
    if (val.isEmpty) return LocaleKeys.validators_empty_email.tr();
    if (!GetUtils.isEmail(val)) return LocaleKeys.validators_invalid_email.tr();
    return null;
  }

  static String? validatePassword(String? val) => (val?.isEmpty ?? false)
      ? LocaleKeys.validators_empty_password.tr()
      : null;

  static String? validateConfirmPassword(String? val, String password) =>
      (val?.isEmpty ?? false)
          ? LocaleKeys.validators_empty_password.tr()
          : (val! != password)
              ? LocaleKeys.validators_password_confirmation.tr()
              : null;
}
