import 'package:get/get.dart';

class RegisterController extends GetxController {
  late final RxBool isChecked;
  @override
  void onInit() {
    isChecked = false.obs;
    super.onInit();
  }
}
