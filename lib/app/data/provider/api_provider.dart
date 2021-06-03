import 'package:get/get.dart';
import 'package:get_app_flutter/app/dot_env.dart';
import 'package:get_app_flutter/app/routes/app_routes.dart';
import 'package:get_storage/get_storage.dart';

class ApiProvider extends GetConnect {
  final storage = GetStorage();

  getHomeData() async {
    var response = await getWithToken(apiURL + '/data-home');
    if (response.statusCode == 200) {
      return response.body['slides'];
    }
  }

  getWithToken(url) {
    final token = verifyAuth();
    return get(url, headers: {'Authorization': 'Bearer ${token}'});
  }

  verifyAuth() {
    var token = storage.read('token');
    if (token != null) {
      return token;
    } else {
      return Routes.LOGIN;
    }
  }
}
