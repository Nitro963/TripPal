import '../../../core/bases.dart';

class LoginState extends BaseState {
  final bool showPassword;
  final String email;
  final String password;
  final String? passwordErrorText;
  final String? emailErrorText;

  LoginState(
    this.email,
    this.password, {
    this.showPassword = false,
    this.passwordErrorText,
    this.emailErrorText,
  });

  @override
  LoginState copyWith(Map<String, dynamic> data) {
    return LoginState(
      data['email'] ?? email,
      data['password'] ?? password,
      showPassword: data['showPassword'] ?? showPassword,
      emailErrorText: data.containsKey('emailErrorText')
          ? data['emailErrorText']
          : emailErrorText,
      passwordErrorText: data.containsKey('passwordErrorText')
          ? data['passwordErrorText']
          : passwordErrorText,
    );
  }
}
