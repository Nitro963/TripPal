import 'package:flutter/material.dart';

import '../widgets/common/custom_back_button.dart';

mixin AppBarBuilder {
  PreferredSizeWidget buildFlatAppBar(String defaultRoute,
      {Widget? title,
      bool centerTitle = false,
      List<Widget> actions = const [],
      Widget? leading,
      Color? backgroundColor,
      bool automaticallyImplyLeading = true,
      bool useCupertinoStyle = true}) {
    return AppBar(
      title: title,
      centerTitle: centerTitle,
      elevation: 0,
      actions: actions,
      backgroundColor: backgroundColor,
      leading: automaticallyImplyLeading
          ? CustomBackButton(
              useCupertinoStyle: useCupertinoStyle,
              defaultRoute: defaultRoute,
            )
          : leading,
    );
  }
}
