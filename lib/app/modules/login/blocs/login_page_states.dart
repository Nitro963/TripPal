import '../../../core/bases.dart';

class LoginState extends BaseAuthState {
  LoginState({
    String? email,
    String? password,
    showPassword = false,
    String? passwordErrorText,
    String? emailErrorText,
  }) : super(
            email: email,
            password: password,
            showPassword: showPassword,
            passwordErrorText: passwordErrorText,
            emailErrorText: emailErrorText);
}
