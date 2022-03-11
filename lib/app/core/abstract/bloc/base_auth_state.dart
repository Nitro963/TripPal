import 'base_state.dart';

class BaseAuthState extends BaseState {
  final String? email;
  final String? password;
  final bool showPassword;
  final String? passwordErrorText;
  final String? emailErrorText;

  BaseAuthState({
    this.email,
    this.password,
    this.showPassword = false,
    this.passwordErrorText,
    this.emailErrorText,
  });

  @override
  BaseAuthState copyWith(Map<String, dynamic> data) {
    return BaseAuthState(
      email: data.containsKey('email') ? data['email'] : email,
      password: data.containsKey('password') ? data['password'] : password,
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
