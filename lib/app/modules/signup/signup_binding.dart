import 'package:get/get.dart';
import 'package:get_app_flutter/app/data/provider/auth_provider.dart';
import 'package:get_app_flutter/app/data/repository/auth_repository.dart';
import 'package:get_app_flutter/app/modules/login/login_controller.dart';
import 'package:get_app_flutter/app/modules/signup/signup_controller.dart';

class SignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());
    Get.lazyPut<AuthApiClient>(() => AuthApiClient());
  }
}
