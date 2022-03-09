import '../../../core/bases.dart';
import '../../../core/control_mixins.dart';
import 'login_page_states.dart';

class LoginCubit extends BaseCubit<LoginState>
    with PasswordFieldControlMixin, EmailFieldControlMixin {
  LoginCubit() : super(LoginState('', '', showPassword: false));

  @override
  bool get showPassword => state.showPassword;

  @override
  set showPassword(bool value) => emit(state.copyWith({'showPassword': value}));

  @override
  set passwordErrorText(String? value) =>
      emit(state.copyWith({'passwordErrorText': value}));

  @override
  set emailErrorText(String? value) =>
      emit(state.copyWith({'emailErrorText': value}));

  Future<void> onSubmit() {
    emit(state.copyWith({'passwordErrorText': null, 'emailErrorText': null}));
    // TODO delegate api call to auth service
    return Future<void>.delayed(const Duration(seconds: 2), () {});
    // try {
    //   // await Get.find<AuthControl>().login(email: email, password: password);
    //   Get.offAllNamed(Routes.HOME);
    // } on dio.DioError catch (e) {
    //   if (e.type == dio.DioErrorType.response) {
    //     switch (e.response!.statusCode) {
    //       case 400:
    //         {
    //           Get.showSnackbar(
    //             Get.find<GetWidgetBuilder>()
    //                 .buildErrorSnackBar(
    //               'Wrong email or password. Try again or click Forgot Password to reset it.',
    //               position: SnackPosition.TOP,
    //               margin:
    //               const EdgeInsets.only(top: 20),
    //               duration: const Duration(seconds: 4),
    //             ),
    //           );
    //           return;
    //         }
    //     }
    //   }
    //   // TODO pass to Error handling service
    //   // handelError(e, onLoginPressed);
    // }
  }
}
