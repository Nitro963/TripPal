import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../core/abstract/get/get_bloc_view.dart';
import '../../../core/common_widgets.dart';
import '../../../core/generics.dart';
import 'login_background.dart';
import 'login_form.dart';

class LoginView extends GetBlocView<InAsyncCallBloc> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: KeyboardDismisser(
        child: Stack(
          children: [
            const LoginBackground(),
            SafeArea(
              child: BlocBuilder<InAsyncCallBloc, bool>(
                bloc: bloc,
                builder: (context, state) => ModalProgressHUD(
                  inAsyncCall: state,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(30),
                    ),
                    child: LoginForm(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
