import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_app_flutter/app/global/widgets/already_have_an_account_acheck.dart';
import 'package:get_app_flutter/app/global/widgets/rounded_button.dart';
import 'package:get_app_flutter/app/global/widgets/rounded_input_field.dart';
import 'package:get_app_flutter/app/global/widgets/rounded_password_field.dart';
import 'package:get_app_flutter/app/modules/signup/background.dart';
import 'package:get_app_flutter/app/modules/signup/or_divider.dart';
import 'package:get_app_flutter/app/modules/signup/signup_controller.dart';
import 'package:get_app_flutter/app/modules/signup/social_icon.dart';

class SignupPage extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKeySignup,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Registro",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: Get.height * 0.03),
                SvgPicture.asset(
                  "assets/icons/signup.svg",
                  height: Get.height * 0.35,
                ),
                RoundedInputField(
                  ctrl: controller.nameInput,
                  hintText: "Nome",
                  onChanged: (value) {},
                ),
                RoundedInputField(
                  ctrl: controller.emailInput,
                  hintText: "Email",
                  onChanged: (value) {},
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
                Obx(
                  () => RoundedPasswordField(
                    showPass: controller.showPass.value,
                    changeButtonPass: () => {
                      controller.showPass.value = !controller.showPass.value
                    },
                    nameInput: 'Confirme a senha',
                    ctrl: controller.passwordConfirmation,
                    onChanged: (value) {},
                  ),
                ),
                Obx(
                  () => RoundedButton(
                    text: controller.loading.value ? "Aguarde" : "Registrar",
                    disabled: controller.loading.value,
                    press: () {
                      controller.onSubmit();
                    },
                  ),
                ),
                SizedBox(height: Get.height * 0.03),
                AlreadyHaveAnAccountCheck(
                    login: false,
                    press: () => controller.toLogin()
                ),
                OrDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocalIcon(
                      iconSrc: "assets/icons/facebook.svg",
                      press: () {},
                    ),
                    SocalIcon(
                      iconSrc: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                    SocalIcon(
                      iconSrc: "assets/icons/google-plus.svg",
                      press: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
