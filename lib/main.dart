import 'package:ecommerce_shop/routes/app_routes.dart';
import 'package:ecommerce_shop/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app_binding.dart';
import 'controllers/theme/theme_controller.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemesController themeController = Get.put(ThemesController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce app',
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: getThemeMode(themeController.theme),
      getPages: Routes.routes,
      initialRoute: Routes.INITIAL,
      initialBinding: AppBinding(),
    );
  }

  ThemeMode getThemeMode(String type) {
    ThemeMode themeMode = ThemeMode.system;
    switch (type) {
      case "system":
        themeMode = ThemeMode.system;
        break;
      case "dark":
        themeMode = ThemeMode.dark;
        break;
      default:
        themeMode = ThemeMode.light;
        break;
    }

    return themeMode;
  }
}
