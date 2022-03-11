import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart' hide Trans;
import 'package:untitled/app/core/common_widgets.dart';

import '../../../core/values.dart';
import '../../../routes/app_pages.dart';
import '../blocs/register_blocs.dart';
import 'registration_background.dart';
import 'registration_form.dart';

class RegisterView extends GetView<RegisterCubit> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const CustomBackButton(
          defaultRoute: Routes.REGISTER,
          color: AppColors.pureWhite,
        ),
      ),
      body: KeyboardDismisser(
        child: Stack(
          children: [
            const RegisterBackground(),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      ScreenUtil().setWidth(Spacing.SCAFFOLD_HORIZONTAL),
                ),
                child: RegistrationForm(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
