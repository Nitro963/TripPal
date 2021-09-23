import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trip_pal_null_safe/utilities/themes.dart';

class AppThemeController extends GetxService {
  final RxInt _themeMode;
  final box = GetStorage();

  int get themeMode => _themeMode.value;

  AppThemeController(int? themeMode)
      : _themeMode = RxInt(themeMode == null ? 1 : themeMode);

  Future<void> updateTheme(int themeMode) async {
    this._themeMode.value = themeMode;
    await box.write('themeMode', themeMode);
    Get.changeTheme(Themes.fromThemeMode(themeMode));
  }
}
