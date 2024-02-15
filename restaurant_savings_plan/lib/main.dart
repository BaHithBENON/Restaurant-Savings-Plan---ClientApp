import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'utilities/config/route_config.dart';
import 'utilities/config/theme_config.dart';
import 'utilities/variables/app_texts.dart';
import 'utilities/variables/enums.dart';
import 'utilities/variables/fonts_names.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeManager.initialise();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
  ));
  
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      statusBarColorBuilder: (theme) => theme!.primaryColor,
      defaultThemeMode: ThemeConfig.getActualThemeMode() == RSPThemeMode.Dark
        ? ThemeMode.dark : ThemeMode.dark,
      darkTheme: ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.grey[900],
      fontFamily: FontsNames.fontPoppins,
      primaryColor: Colors.grey[900],
      cardColor: const Color.fromARGB(255, 56, 55, 55),
      canvasColor: const Color.fromARGB(255, 56, 55, 55),
    ),
      lightTheme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: FontsNames.fontPoppins,
        primaryColor: Colors.white,
        cardColor: const Color.fromARGB(255, 245, 245, 245),
        canvasColor: const Color.fromARGB(255, 245, 245, 245),
        focusColor: const Color.fromARGB(246, 243, 237, 237),
      ),
      builder: (context, regularTheme, darkTheme, themeMode) => GetMaterialApp(
        navigatorKey: navigatorKey,
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: regularTheme,
        darkTheme: darkTheme,
        themeMode: themeMode as ThemeMode,
        // home: const SplashUI(),
        initialRoute: '/',
        routes: getAppRoutes(context),
      ),
    );
  }
}
