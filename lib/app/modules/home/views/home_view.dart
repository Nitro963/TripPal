import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../core/bases.dart';
import '../../../core/generics.dart';
import '../../../core/services.dart';
import '../../../routes/app_pages.dart';
import '../blocs/home_cubit.dart';

class HomeView extends GetBlocView<HomeCubit> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.label_main.tr),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(MaterialCommunityIcons.google_translate),
            onPressed: () {
              final id = LocalizationService.instance.currentLocaleID;
              LocalizationService.instance.updateLocale((id + 1) %
                  LocalizationService.instance.supportedLocale.length);
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: bloc.increment,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Center(
        child: BlocBuilder<HomeCubit, DataReadyState<int>>(
          bloc: bloc,
          builder: (_, state) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.actions_home_page_main_action.tr,
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                '${state.data}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(50),
                width: ScreenUtil().setWidth(325),
                child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.LOGIN);
                    },
                    child: const Text('Continue')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
