import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_app_flutter/app/routes/app_pages.dart';
import 'package:get_app_flutter/app/routes/app_routes.dart';
import 'package:get_app_flutter/app/theme/app_theme.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    title: 'App_Name',
    debugShowCheckedModeBanner: false,
    theme: appThemeData,
    initialRoute: Routes.INITIAL,
    getPages: AppPages.routes,
//    initialBinding: ,
  ));
}
