import 'package:get_app_flutter/app/data/models/auth_model.dart';
import 'package:get_app_flutter/app/data/provider/auth_provider.dart';

class AuthRepository {
  final AuthApiClient api = AuthApiClient();

  login(String username, String password) async {
    var json = await api.login(username, password);
    return Auth.fromJson(json);
  }
}
