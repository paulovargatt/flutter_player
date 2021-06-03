import 'package:get/get.dart';
import 'package:get_app_flutter/app/routes/app_routes.dart';
import 'package:get_storage/get_storage.dart';

class InitialController extends GetxController {
  RxInt clicked = 0.obs;

  final storage = GetStorage();

  verifyAuth() {
    var token = '';

    token = storage.read('token');
    if (token != null) {
      return Routes.TAB_HOME;
    } else {
      return Routes.WELCOME;
    }
  }
}
