import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/values.dart';

class RestPasswordStage extends StatelessWidget {
  const RestPasswordStage({
    Key? key,
    required this.stageName,
    required this.stageAction,
    required this.child,
    required this.onButtonPressed,
    required this.buttonText,
  }) : super(key: key);

  final String stageName;
  final String stageAction;
  final String buttonText;
  final void Function() onButtonPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(Spacing.SCAFFOLD_HORIZONTAL)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ScreenUtil().setVerticalSpacing(Spacing.CREDENTIALS_PAGE_HEADER_GAP),
          Text(
            stageName,
            style: TextStyles.h1.apply(
              color: AppColors.navyBlack.withAlpha(200),
            ),
          ),
          ScreenUtil().setVerticalSpacing(8),
          Text(
            stageAction,
            style: TextStyles.h2.apply(color: AppColors.halfGrey),
          ),
          ScreenUtil().setVerticalSpacing(32),
          child,
          Container(
            margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(48)),
            height: ScreenUtil().setHeight(50),
            child: ElevatedButton(
              onPressed: onButtonPressed,
              child: Text(buttonText),
            ),
          )
        ],
      ),
    );
  }
}
