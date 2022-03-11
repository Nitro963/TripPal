import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../generated/locale_keys.g.dart';
import '../../../core/auth_widgets.dart';
import '../../../core/bases.dart';
import '../../../core/generics.dart';
import '../../../core/values.dart';
import '../../../routes/app_pages.dart';
import '../blocs/login_cubit.dart';

class LoginFormHeader extends StatelessWidget {
  const LoginFormHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
      child: Text(
        LocaleKeys.label_turn_your_trip_into_an_adventure.tr(),
        textAlign: TextAlign.center,
        style: TextStyles.h3.apply(
          color: AppColors.navyBlack.withAlpha(150),
          fontSizeDelta: -1,
        ),
      ),
    );
  }
}

class LoginForm extends GetBlocView<LoginCubit> {
  LoginForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const LoginFormHeader(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScreenUtil().setVerticalSpacing(24),
                BlocBuilder<LoginCubit, BaseAuthState>(
                    bloc: bloc,
                    builder: (context, state) {
                      return EmailFieldAlt(
                        errorText: state.emailErrorText,
                        controller: bloc.emailFieldController,
                        hintText: LocaleKeys.label_email.tr(),
                      );
                    }),
                ScreenUtil().setVerticalSpacing(24),
                BlocBuilder<LoginCubit, BaseAuthState>(
                  bloc: bloc,
                  builder: (context, state) {
                    return PasswordFieldAlt(
                      showPassword: state.showPassword,
                      errorText: state.passwordErrorText,
                      controller: bloc.passwordFieldController,
                      onSuffixIconPressed: bloc.toggleShowPassword,
                      hintText: LocaleKeys.label_password.tr(),
                    );
                  },
                ),
                ScreenUtil().setVerticalSpacing(36),
                Container(
                  width: double.infinity,
                  height: ScreenUtil().setHeight(50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        Decorations.ELEVATED_BUTTON_ROUND_RADIUS),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(elevation: 12),
                    child: Text(
                      LocaleKeys.buttons_login.tr(),
                    ),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState!.validate()) {
                        Get.find<InAsyncCallBloc>().execute(bloc.onSubmit);
                      }
                    },
                  ),
                ),
                const Expanded(
                  child: LoginFormFooter(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoginFormFooter extends StatelessWidget {
  const LoginFormFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CupertinoButton(
          onPressed: () => Get.toNamed(Routes.REST_PASSWORD),
          child: Text(
            LocaleKeys.buttons_forgot_password.tr(),
            style: TextStyles.h4.copyWith(
              fontWeight: FontWeight.normal,
              color: AppColors.pureWhite,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        CupertinoButton(
          onPressed: () async {
            // Get.find<AuthControl>().activateGuestMode();
            Get.offAllNamed(Routes.HOME);
          },
          child: Text(
            LocaleKeys.buttons_login_as_guest.tr(),
            style: TextStyles.h4.copyWith(
              fontWeight: FontWeight.normal,
              color: AppColors.pureWhite,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        Text(
          LocaleKeys.label_login_with_social.tr(),
          textAlign: TextAlign.center,
          style: TextStyles.h5.apply(color: AppColors.pureWhite),
        ),
        Row(children: [
          MaterialButton(
              onPressed: () {
                // Get.put<UsersListController>(UsersListController());
                // Get.to(() => UsersList());
              },
              color: const Color(0xff3b5998),
              textColor: Colors.white,
              child: const Icon(
                FontAwesome.facebook_f,
                size: 30,
              ),
              padding: const EdgeInsets.all(16),
              shape: const CircleBorder()),
          MaterialButton(
              onPressed: () {},
              color: const Color(0xff2ca7e0),
              textColor: Colors.white,
              child: const Icon(
                FontAwesome.twitter,
                size: 30,
              ),
              padding: const EdgeInsets.all(16),
              shape: const CircleBorder()),
        ], mainAxisAlignment: MainAxisAlignment.spaceEvenly),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              LocaleKeys.label_do_not_have_an_account.tr(),
              style: TextStyles.h5.apply(color: AppColors.pureWhite),
            ),
            CupertinoButton(
              onPressed: () => Get.toNamed(Routes.REGISTER),
              child: Text(
                LocaleKeys.buttons_sign_up.tr(),
                style: TextStyles.h5.copyWith(
                  decoration: TextDecoration.underline,
                  color: AppColors.pureWhite, // Text colour here
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
