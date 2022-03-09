import 'package:flutter/material.dart';

import '../widgets/common/custom_back_button.dart';

mixin AppBarBuilder {
  PreferredSizeWidget buildFlatAppBar(String defaultRoute,
      {Widget? title,
      bool centerTitle = false,
      List<Widget> actions = const [],
      Widget? leading,
      bool automaticallyImplyLeading = true}) {
    return AppBar(
      title: title,
      centerTitle: centerTitle,
      elevation: 0,
      actions: actions,
      leading: automaticallyImplyLeading
          ? CustomBackButton(
              defaultRoute: defaultRoute,
            )
          : leading,
    );
  }
}
