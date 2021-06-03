import 'package:get_app_flutter/app/data/models/user_model.dart';

class Auth {
  Object user = User;
  String message = '';
  String accessToken = '';
  String tokenType = '';
  int expiresIn = 0;


  Auth({
      required this.user,
      required this.message,
      required this.accessToken,
      required this.tokenType,
      required this.expiresIn,
      });

  Auth.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    user = json['user'];
  }

  


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    data['user'] = this.user;
    return data;
  }
}
