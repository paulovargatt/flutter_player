import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_app_flutter/app/global/widgets/rounded_button.dart';
import 'package:get_app_flutter/app/modules/welcome/background.dart';
import 'package:get_app_flutter/app/modules/welcome/welcome_controller.dart';

class WelcomePage extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "WELCOME TO EDU",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: Get.height * 0.05),
              SvgPicture.asset(
                "assets/icons/chat.svg",
                height: Get.height * 0.45,
              ),
              SizedBox(height: Get.height * 0.05),
              RoundedButton(text: "LOGIN", press: () => Get.toNamed('/login')),
              RoundedButton(
                  text: "SIGN UP",
                  color: Get.theme.primaryColorLight,
                  press: () => Get.toNamed('/signup')
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final Function click = () {
  ;
};
