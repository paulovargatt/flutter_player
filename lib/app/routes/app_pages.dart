import 'package:get/get.dart';
import 'package:get_app_flutter/app/modules/initial/initial_binding.dart';
import 'package:get_app_flutter/app/modules/initial/initial_view.dart';
import 'package:get_app_flutter/app/modules/login/login_binding.dart';
import 'package:get_app_flutter/app/modules/login/login_view.dart';
import 'package:get_app_flutter/app/modules/signup/signup_binding.dart';
import 'package:get_app_flutter/app/modules/signup/signup_view.dart';
import 'package:get_app_flutter/app/modules/tabs/tab_binding.dart';
import 'package:get_app_flutter/app/modules/tabs/tab_view.dart';
import 'package:get_app_flutter/app/modules/welcome/welcome_binding.dart';
import 'package:get_app_flutter/app/modules/welcome/welcome_view.dart';
import 'package:get_app_flutter/app/routes/app_routes.dart';

class AppPages {
  static const INITIAL = Routes.INITIAL;

  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => InitialPage(), //InitialView(),
      binding: InitialBinding(), //InitialBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.WELCOME,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => SignupPage(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: Routes.TAB_HOME,
      page: () => TabPage(),
      binding: TabBinding(),
    )
  ];
}
