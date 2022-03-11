import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:untitled/app/core/abstract/bloc/base_auth_state.dart';

import 'package:untitled/app/core/services.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../core/abstract/get/get_bloc_view.dart';
import '../../../core/common_widgets.dart';
import '../../../core/generics.dart';
import '../../../core/values.dart';
import '../../../routes/app_pages.dart';
import '../blocs/login_cubit.dart';

class LoginViewAlt extends GetBlocView<LoginCubit> {
  LoginViewAlt({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InAsyncCallBloc, bool>(
      bloc: Get.find<InAsyncCallBloc>(),
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: state,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar:
              Get.find<GetWidgetBuilder>().buildFlatAppBar(AppPages.INITIAL),
          body: KeyboardDismisser(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal:
                      ScreenUtil().setWidth(Spacing.SCAFFOLD_HORIZONTAL)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ScreenUtil()
                      .setVerticalSpacing(Spacing.CREDENTIALS_PAGE_HEADER_GAP),
                  Text(
                    LocaleKeys.label_welcome_login
                        .trParams({'name': LocaleKeys.settings_app_title.tr}),
                    style: TextStyles.h1,
                  ),
                  ScreenUtil().setVerticalSpacing(20),
                  Text(
                    LocaleKeys.actions_login_page_main_action.tr,
                    style: TextStyles.h2.apply(color: AppColors.darkGrey),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(32),
                  ),
                  BlocBuilder<LoginCubit, BaseAuthState>(
                    bloc: bloc,
                    builder: (context, state) => Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          EmailField(
                            errorText: state.emailErrorText,
                            labelText: LocaleKeys.label_email.tr,
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(24),
                          ),
                          PasswordField(
                            showPassword: state.showPassword,
                            controller: bloc.passwordFieldController,
                            onSuffixIconPressed: bloc.toggleShowPassword,
                            labelText: LocaleKeys.label_password.tr,
                            errorText: state.passwordErrorText,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(64)),
                    height: ScreenUtil().setHeight(50),
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          await Get.find<InAsyncCallBloc>()
                              .execute<void>(bloc.onSubmit);
                        }
                      },
                      icon: const LanguageAwareIcon(icon: Icons.login_outlined),
                      label: Text(
                        LocaleKeys.buttons_login.tr,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin:
                          EdgeInsets.only(bottom: ScreenUtil().setHeight(8)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () =>
                                    Get.toNamed(Routes.REST_PASSWORD),
                                child: Text(
                                  LocaleKeys.buttons_forgot_password.tr,
                                  style: TextStyles.h3
                                      .apply(color: AppColors.navyBlack),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  LocaleKeys.buttons_sign_up.tr,
                                  style: TextStyles.h3,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
