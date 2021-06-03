import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_app_flutter/app/data/models/user_model.dart';
import 'package:get_app_flutter/app/data/provider/auth_provider.dart';
import 'package:get_app_flutter/app/routes/app_routes.dart';

class SignupController extends GetxController {
  final formKeySignup = GlobalKey<FormState>();

  final service = Get.find<AuthApiClient>();

  TextEditingController nameInput = TextEditingController();
  TextEditingController emailInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();
  TextEditingController passwordConfirmation = TextEditingController();

  RxBool loading = false.obs;
  RxBool showPass = false.obs;

  onSubmit() async {
    if (formKeySignup.currentState!.validate()) {
      loading.value = true;
      var res = await service.register(nameInput.text, emailInput.text,
          passwordInput.text, passwordConfirmation.text);
      if (res['status'] == 200) {
        Get.defaultDialog(
            title: 'Sucesso', content: Text('Usuário cadastrado'));
        Get.offAllNamed(Routes.LOGIN);
        // Redirect after cadastro
      } else {
        Get.defaultDialog(title: 'Ops', content: Text(res['message']));
      }
      loading.value = false;
    }
  }

  toLogin() {
    Get.offAllNamed(Routes.LOGIN);
  }
}
