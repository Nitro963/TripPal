import 'package:untitled/app/core/auth_widgets.dart';

import '../../../core/bases.dart';
import '../../../core/control_mixins.dart';

class RegistrationState extends BaseAuthState {
  RegistrationState({
    this.birthdateErrorText,
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
  final String? birthdateErrorText;
  @override
  RegistrationState copyWith(Map<String, dynamic> data) {
    return RegistrationState(
      email: data.containsKey('email') ? data['email'] : email,
      password: data.containsKey('password') ? data['password'] : password,
      showPassword: data['showPassword'] ?? showPassword,
      emailErrorText: data.containsKey('emailErrorText')
          ? data['emailErrorText']
          : emailErrorText,
      passwordErrorText: data.containsKey('passwordErrorText')
          ? data['passwordErrorText']
          : passwordErrorText,
      birthdateErrorText: data.containsKey('birthdateErrorText')
          ? data['birthdateErrorText']
          : emailErrorText,
    );
  }
}

class RegisterCubit extends BaseCubit<RegistrationState>
    with PasswordFieldControlMixin, EmailFieldControlMixin {
  RegisterCubit() : super(RegistrationState());

  @override
  bool get showPassword => state.showPassword;

  @override
  set emailErrorText(String? value) =>
      emit(state.copyWith({'emailErrorText': value}));

  @override
  set passwordErrorText(String? value) =>
      emit(state.copyWith({'passwordErrorText': value}));

  set birthdateErrorText(String? value) =>
      emit(state.copyWith({'birthdateErrorText': value}));

  @override
  set showPassword(bool value) => emit(state.copyWith({'showPassword': value}));

  final DateTimePickerController birthdateFieldController =
      DateTimePickerController();
  @override
  void onInit() {
    passwordFieldController.addListener(() {
      emit(state.copyWith({'password': passwordFieldController.text}));
    });
    emailFieldController.addListener(() {
      emit(state.copyWith({'email': emailFieldController.text}));
    });
    super.onInit();
  }

  Future<void> onSubmit() async {
    // final requestData = {
    //   'email': emailFieldController.text,
    //   'password': passwordFieldController.text,
    //   'first_name': state.firstName,
    //   'last_name': state.lastName,
    //   'birthdate':birthdateFieldController.value,
    // };
  }
}
