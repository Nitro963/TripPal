import 'package:flutter/material.dart';

import '../../../core/bases.dart';
import '../../../core/control_mixins.dart';

class RestPasswordState extends BaseState {
  final int currentPage;
  final bool showPassword;
  final String password;
  final String? passwordErrorText;

  RestPasswordState(
    this.currentPage,
    this.password,
    this.showPassword,
    this.passwordErrorText,
  );

  @override
  RestPasswordState copyWith(Map<String, dynamic> data) => RestPasswordState(
      data['currentPage'] ?? currentPage,
      data['password'] ?? password,
      data['showPassword'] ?? showPassword,
      data.containsKey('passwordErrorText')
          ? data['passwordErrorText']
          : passwordErrorText);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RestPasswordState &&
          runtimeType == other.runtimeType &&
          currentPage == other.currentPage &&
          showPassword == other.showPassword &&
          password == other.password &&
          passwordErrorText == other.passwordErrorText;

  @override
  int get hashCode =>
      currentPage.hashCode ^
      showPassword.hashCode ^
      password.hashCode ^
      passwordErrorText.hashCode;
}

class RestPasswordCubit extends BaseCubit<RestPasswordState>
    with PageViewControlMixin, PasswordFieldControlMixin {
  RestPasswordCubit([int initialPage = 0])
      : super(RestPasswordState(initialPage, '', false, null));

  @override
  final controller = PageController();

  @override
  int get totalPages => 3;

  @override
  int get currentPage => state.currentPage;

  @override
  set currentPage(int value) => emit(state.copyWith({'currentPage': value}));

  @override
  bool get showPassword => state.showPassword;

  @override
  set passwordErrorText(String? value) =>
      emit(state.copyWith({'passwordErrorText': value}));

  @override
  set showPassword(bool value) => emit(state.copyWith({'showPassword': value}));

  void onPasswordChanged(String? value) =>
      emit(state.copyWith({'password': value}));

  Future<void> onSave() async {}
}
