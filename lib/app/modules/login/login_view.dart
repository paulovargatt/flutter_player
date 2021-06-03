import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_app_flutter/app/global/widgets/already_have_an_account_acheck.dart';
import 'package:get_app_flutter/app/global/widgets/rounded_button.dart';
import 'package:get_app_flutter/app/global/widgets/rounded_input_field.dart';
import 'package:get_app_flutter/app/global/widgets/rounded_password_field.dart';
import 'package:get_app_flutter/app/modules/login/login_controller.dart';
import 'package:get_app_flutter/app/modules/welcome/background.dart';

final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  primary: Colors.white,
  backgroundColor: Get.theme.primaryColor,
  minimumSize: Size(88, 55),
  padding: EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2.0)),
  ),
);

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Entrar",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: Get.height * 0.03),
                SvgPicture.asset(
                  "assets/icons/login.svg",
                  height: Get.height * 0.35,
                ),
                SizedBox(height: Get.height * 0.03),
                RoundedInputField(
                  hintText: "Email",
                  onChanged: (value) {},
                  ctrl: controller.emailInput,
                ),
                Obx(
                  () => RoundedPasswordField(
                    showPass: controller.showPass.value,
                    changeButtonPass: () => {
                      controller.showPass.value = !controller.showPass.value
                    },
                    ctrl: controller.passwordInput,
                    onChanged: (value) {},
                  ),
                ),
                Obx(() => Visibility(
                    visible: !controller.loading.value,
                    child: RoundedButton(
                      press: () => controller.login(),
                      text: 'Login',
                    ))),
                Obx(
                  () => Visibility(
                    visible: controller.loading.value,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: Get.width * 0.8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(29),
                        child: TextButton(
                          onPressed: () => {},
                          style: flatButtonStyle,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  press: () => controller.toRegister(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
