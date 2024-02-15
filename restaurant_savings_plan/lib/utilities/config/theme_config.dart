import 'package:get_storage/get_storage.dart';

import '../variables/enums.dart';

class ThemeConfig {
  static var themeData = GetStorage('Theme');
  static RSPThemeMode getActualThemeMode() {
    themeData.writeIfNull('theme_mode', 'light');
    if (themeData.read('theme_mode') == 'light') {
      return RSPThemeMode.Light;
    } else {
      return RSPThemeMode.Dark;
    }
  }
}
