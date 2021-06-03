import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_app_flutter/app/global/widgets/text_field_container.dart';
import 'package:get_app_flutter/app/modules/login/login_controller.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final onChanged;
  final ctrl;

  RoundedInputField({
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
    required this.ctrl,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Insira um e-mail válido';
          }
          return null;
        },
        controller: ctrl,
        onChanged: onChanged,
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
          fillColor: Colors.white,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
