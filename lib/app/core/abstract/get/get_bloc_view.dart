import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

abstract class GetBlocView<B> extends StatelessWidget {
  const GetBlocView({Key? key}) : super(key: key);

  B get bloc => Get.find<B>();
}
