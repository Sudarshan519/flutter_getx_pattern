import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:hajir/app/config/app_colors.dart';
import 'package:hajir/app/initial_bindings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hajir/core/app_settings/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await appInit();
  runApp(
    GetMaterialApp(
      theme: ThemeData(primaryColor: AppColors.primary),
      title: "Application",
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: AppSettings(Get.find()).getLocale(),
      supportedLocales: const [Locale("en", "US"), Locale('ne', "NE")],
      initialRoute: AppPages.INITIAL,
      initialBinding: InitialBindings(),
      getPages: AppPages.routes,
    ),
  );
}

appInit() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  AppSettings appSettings = AppSettings(sharedPreferences);
  Get.lazyPut<SharedPreferences>(() => sharedPreferences);

  Get.lazyPut<AppSettings>(() => appSettings);
  await ScreenUtil.ensureScreenSize();
}
