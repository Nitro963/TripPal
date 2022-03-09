// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar_SY = {
  "settings": {
    "theme": "المظهر",
    "app_title": "تريب بال"
  },
  "validators": {
    "wrong_email_or_password": "خطأ في كلمة السر أو البريد الإلكتروني",
    "empty_email": "من فضلك أدخل عنوان بريدك الإلكتروني",
    "invalid_email": "عنوان البريد الإلكتروني غير صالح",
    "empty_password": "الرجاء إدخال كلمة سر",
    "long_name": "يجب أن يكون طول الاسم أقل من {}",
    "password_confirmation": "كلمة السر غير متطابقة"
  },
  "label": {
    "main": "الرئيسية",
    "email": "البريد الإلكتروني",
    "password": "كلمة السر",
    "new_password": "كلمة السر الجديدة",
    "welcome_login": "أهلاً بك مجددًا في {}",
    "reset_password": "إعادة تهيئة كلمة السر",
    "verification": "التحقق",
    "verification_code": "رمز التحقق",
    "update_password": "تحديث كلمة السر",
    "confirm_new_password": "تأكيد كلمة السر",
    "turn_your_trip_into_an_adventure": "حوّل رحلتك إلى مغامرة",
    "login_with_social": "تسجيل الدخول باستخدام حسابات التواصل الاجتماعي",
    "do_not_have_an_account": "ليس لديك حساب؟"
  },
  "buttons": {
    "login": "تسجيل الدخول",
    "forgot_password": "هل نسيت كلمة السر؟",
    "sign_up": "التسجيل",
    "register": "تسجيل",
    "reset": "إعادة التهيئة",
    "verify": "تأكيد",
    "save": "حفظ",
    "login_as_guest": "تسجيل الدخول كضيف؟"
  },
  "actions": {
    "home_page_main_action": "اضغط الزر لزيادة العداد",
    "login_page_main_action": "الرجاء تعبئة الحقول لتسجيل الدخول",
    "reset_password_page_main_action": "الرجاء إدخال البريد الإلكتروني الخاص بحسابك الشخصي",
    "reset_password_verification_page_main_action": "أدخل الرمز المكون من 4 أرقام المرسل إلى بريدك الإلكتروني",
    "reset_password_update_password_page_main_action": "أكمل البيانات التالية لاستعادة حسابك"
  }
};
static const Map<String,dynamic> en_US = {
  "settings": {
    "theme": "theme",
    "app_title": "TripPal"
  },
  "validators": {
    "wrong_email_or_password": "Wrong Email or Password",
    "empty_email": "Please enter your Email Address",
    "invalid_email": "Please enter a valid Email Address!",
    "empty_password": "Please enter a password",
    "long_name": "Name length must be under {} character",
    "password_confirmation": "Password does not match"
  },
  "label": {
    "main": "Main",
    "email": "Email",
    "password": "Password",
    "new_password": "New Password",
    "welcome_login": "Welcome back to {}",
    "reset_password": "Reset Password",
    "verification": "Verification",
    "verification_code": "Verification Code",
    "update_password": "Update Password",
    "confirm_new_password": "Confirm Password",
    "turn_your_trip_into_an_adventure": "Turn your trip into an adventure",
    "login_with_social": "Login With social Account",
    "do_not_have_an_account": "Don't have an account?"
  },
  "buttons": {
    "login": "Login",
    "forgot_password": "Forgot your password?",
    "sign_up": "Sign Up",
    "register": "REGISTER",
    "reset": "RESET",
    "verify": "VERIFY",
    "save": "SAVE",
    "login_as_guest": "Login as Guest"
  },
  "actions": {
    "home_page_main_action": "Touch the button to increase the counter",
    "login_page_main_action": "Please provide your credentials to login",
    "reset_password_page_main_action": "Enter your account email to reset your password",
    "reset_password_verification_page_main_action": "Enter the 4 digit code sent to your email",
    "reset_password_update_password_page_main_action": "Complete the following data to recover your account"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar_SY": ar_SY, "en_US": en_US};
}
