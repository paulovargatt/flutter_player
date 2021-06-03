import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_app_flutter/app/modules/initial/initial_controller.dart';
import 'package:get_app_flutter/app/routes/app_routes.dart';
import 'package:splashscreen/splashscreen.dart';

class InitialPage extends GetView<InitialController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SplashScreen(
            seconds: 1,
            gradientBackground: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.white, Colors.grey],
            ),
            navigateAfterSeconds: controller.verifyAuth(),
            loaderColor: Colors.transparent,
          ),
          Container(
            margin: EdgeInsets.all(50),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/logo.png"),
                fit: BoxFit.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
