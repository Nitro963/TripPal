import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' hide Trans;
import 'package:untitled/app/core/abstract/get/get_bloc_view.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../core/auth_widgets.dart';
import '../../../core/utils/validators.dart';
import '../../../core/values.dart';
import '../blocs/register_blocs.dart';

class RegistrationForm extends GetBlocView<RegisterCubit> {
  RegistrationForm({
    Key? key,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  decoration: Decorations.kCredentialsInputDecorations.copyWith(
                    hintText: LocaleKeys.label_first_name.tr(),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  validator: Validators.validateFirstName,
                  style: const TextStyle(color: Colors.white),
                  onChanged: (val) {},
                ),
              ),
              Expanded(
                child: TextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  style: const TextStyle(color: Colors.white),
                  decoration: Decorations.kCredentialsInputDecorations.copyWith(
                    hintText: LocaleKeys.label_last_name.tr(),
                  ),
                  validator: Validators.validateLastName,
                  onChanged: (val) {},
                ),
              ),
            ],
          ),
          // ScreenUtil().setVerticalSpacing(24),
          EmailFieldAlt(
            controller: bloc.emailFieldController,
            hintText: LocaleKeys.label_email.tr(),
          ),
          // ScreenUtil().setVerticalSpacing(24),
          DateTimePickerAlt(
            firstDate: DateTime.utc(1970),
            lastDate: DateTime.now(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: Validators.validateNoneEmptySelection,
            controller: bloc.birthdateFieldController,
            errorTextStyle: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(color: AppColors.orangeFresh),
            hintText: LocaleKeys.label_birthdate.tr(),
          ),
          // DateTimePicker(
          //   firstDate: DateTime(1970),
          //   initialDate: DateTime.now(),
          //   lastDate: DateTime(2100),
          //   style: const TextStyle(color: AppColors.pureWhite),
          //   locale: Localizations.localeOf(context),
          //   decoration: Decorations.kCredentialsInputDecorations.copyWith(
          //     hintText: LocaleKeys.label_birthdate.tr(),
          //     prefixIcon: const Icon(Icons.calendar_today_outlined,
          //         color: AppColors.pureWhite),
          //   ),
          // ),
          // ScreenUtil().setVerticalSpacing(24),
          BlocBuilder<RegisterCubit, RegistrationState>(
              bloc: bloc,
              builder: (context, state) {
                return PasswordFieldAlt(
                  controller: bloc.passwordFieldController,
                  showPassword: state.showPassword,
                  onSuffixIconPressed: bloc.toggleShowPassword,
                  hintText: LocaleKeys.label_password.tr(),
                );
              }),
          // ScreenUtil().setVerticalSpacing(24),
          BlocBuilder<RegisterCubit, RegistrationState>(
              bloc: bloc,
              builder: (context, state) {
                return PasswordConfirmationFieldAlt(
                  password: state.password,
                  showPassword: state.showPassword,
                  onSuffixIconPressed: bloc.toggleShowPassword,
                  hintText: LocaleKeys.label_confirm_new_password.tr(),
                );
              }),
          // ScreenUtil().setVerticalSpacing(36),
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
                LocaleKeys.buttons_register.tr(),
              ),
              onPressed: () {
                FocusScope.of(context).unfocus();
                if (_formKey.currentState!.validate()) {
                  // Get.find<InAsyncCallBloc>().execute(bloc.onSubmit);
                }
              },
            ),
          ),
          const RegistrationFormFooter()
        ],
      ),
    );
  }
}

class RegistrationFormFooter extends StatelessWidget {
  const RegistrationFormFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(LocaleKeys.label_sign_up_with_social.tr(),
            style: TextStyles.h5.copyWith(color: AppColors.pureWhite)),
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Row(children: [
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
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              LocaleKeys.label_already_have_an_account.tr(),
              style: TextStyles.h5.copyWith(color: AppColors.pureWhite),
            ),
            CupertinoButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                LocaleKeys.buttons_login.tr(),
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
