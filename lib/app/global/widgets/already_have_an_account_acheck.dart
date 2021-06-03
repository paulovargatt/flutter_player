import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final press;

  AlreadyHaveAnAccountCheck({
    this.login = true,
    required VoidCallback this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Não possui uma conta ? " : "Já possui uma conta? ",
          style: TextStyle(color: Get.theme.primaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Registrar" : "Logar",
            style: TextStyle(
              color: Get.theme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
