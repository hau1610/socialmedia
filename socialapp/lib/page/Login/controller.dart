import 'package:get/get.dart';

class LoginController extends GetxController {
  late final RxBool savePassword;
  late final RxBool showPassword;
  @override
  void onInit() {
    savePassword = false.obs;
    showPassword = false.obs;
    super.onInit();
  }
}
