import 'package:flutter/widgets.dart';

import '../../ui/home_ui.dart';
import '../../ui/splash_ui.dart';

Map<String, Widget Function(BuildContext)> getAppRoutes(BuildContext context) => {
  '/': (context) => const SplashUI(),
  '/home': (context) => const HomeUI(),
};