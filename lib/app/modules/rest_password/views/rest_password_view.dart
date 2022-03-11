import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' hide Trans;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../core/bases.dart';
import '../../../core/common_widgets.dart';
import '../../../core/generics.dart';
import '../../../core/values.dart';
import '../../../core/widgets/custom/email_field_alt.dart';
import '../../../core/widgets/custom/password_field_alt.dart';
import '../../../routes/app_pages.dart';
import '../blocs/rest_password_cubit.dart';
import 'rest_password_stage.dart';

class RestPasswordView extends GetBlocView<RestPasswordCubit> {
  RestPasswordView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InAsyncCallBloc, bool>(
      bloc: Get.find<InAsyncCallBloc>(),
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state,
          child: Scaffold(
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: const CustomBackButton(
                color: AppColors.pureWhite,
                defaultRoute: Routes.LOGIN,
              ),
            ),
            body: Stack(
              children: [
                Image.asset(
                  'assets/images/password-reset.jpg',
                  fit: BoxFit.cover,
                  color: Colors.black26,
                  colorBlendMode: BlendMode.darken,
                  height: double.infinity,
                  width: double.infinity,
                ),
                KeyboardDismisser(
                  child: PageView(
                    controller: bloc.controller,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      RestPasswordStage(
                        stageName: LocaleKeys.label_reset_password.tr(),
                        stageAction: LocaleKeys
                            .actions_reset_password_page_main_action
                            .tr(),
                        buttonText: LocaleKeys.buttons_reset.tr(),
                        onButtonPressed: bloc.jumpToNextPage,
                        child: EmailFieldAlt(
                          hintText: LocaleKeys.label_email.tr(),
                        ),
                      ),
                      RestPasswordStage(
                        stageName: LocaleKeys.label_verification.tr(),
                        stageAction: LocaleKeys
                            .actions_reset_password_verification_page_main_action
                            .tr(),
                        buttonText: LocaleKeys.buttons_verify.tr(),
                        onButtonPressed: bloc.jumpToNextPage,
                        child: VerificationCodeField(
                          labelText: LocaleKeys.label_verification_code.tr(),
                        ),
                      ),
                      RestPasswordStage(
                        stageName: LocaleKeys.label_update_password.tr(),
                        stageAction: LocaleKeys
                            .actions_reset_password_update_password_page_main_action
                            .tr(),
                        buttonText: LocaleKeys.buttons_save.tr(),
                        onButtonPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            // Get.find<InAsyncCallBloc>().execute(bloc.onSave);
                          }
                        },
                        child:
                            BlocBuilder<RestPasswordCubit, RestPasswordState>(
                                bloc: bloc,
                                builder: (context, state) {
                                  return Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        PasswordFieldAlt(
                                          hintText:
                                              LocaleKeys.label_password.tr(),
                                          controller:
                                              bloc.passwordFieldController,
                                          showPassword: state.showPassword,
                                          onChanged: bloc.onPasswordChanged,
                                          onSuffixIconPressed:
                                              bloc.toggleShowPassword,
                                        ),
                                        ScreenUtil().setVerticalSpacing(16),
                                        PasswordConfirmationFieldAlt(
                                          password: state.password,
                                          hintText: LocaleKeys
                                              .label_confirm_new_password
                                              .tr(),
                                          showPassword: state.showPassword,
                                          onSuffixIconPressed:
                                              bloc.toggleShowPassword,
                                        )
                                      ],
                                    ),
                                  );
                                }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
