import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:socialapp/model/user_info.dart';
import 'package:socialapp/provider/account_provider.dart';
import 'package:socialapp/widgets/LoadingOverLay/index.dart';

import '../../commons.dart';
import '../../get_routes.dart';
import '../../global.dart';

class LoginController extends GetxController with LoadingOverlay {
  late final RxBool savePassword;
  late final RxBool showPassword;
  late final AccountProvider accountProvider;
  late final Rx<UserInfo> userInfo;
  late final TextEditingController username;
  late final TextEditingController password;
  late final RxString usernameErr;
  late final RxString passwordErr;
  @override
  final BuildContext context;

  LoginController(this.context);

  @override
  void onInit() {
    username = TextEditingController();
    password = TextEditingController();
    accountProvider = AccountProvider();
    userInfo = Rx<UserInfo>(UserInfo());
    usernameErr = RxString('');
    passwordErr = RxString('');
    savePassword = false.obs;
    showPassword = false.obs;
    super.onInit();
  }

  Future<void> login() async {
    validateUsername();
    validatePassword();

    if (usernameErr.value.isEmpty && passwordErr.isEmpty) {
      final UserInfo? loginData = await load<UserInfo?>(
          accountProvider.login(username.text.trim(), password.text.trim()));

      if (loginData != null && loginData.sId != null) {
        storage.setString(KEY.idUser.toString(), loginData.sId!);

        storage.setString(KEY.password.toString(), password.text);
        storage.setString(
            KEY.loginData.toString(), json.encode(loginData.toJson()));
        Get.offAllNamed(Routes.homepage);

        if (savePassword.value) {
          storage.setString(KEY.saveAccount.toString(), username.text.trim());
        } else {
          storage.remove(KEY.saveAccount.toString());
        }
      } else {
        showNotification(NOTIFICATION_TYPE.error, 'Đăng nhập',
            'Tài khoản hoặc mật khẩu không đúng. Vui lòng thử lại.');
      }
    }
  }

  void validateUsername() {
    if (username.text.trim().isEmpty) {
      usernameErr('Tài khoản không được để trống');
    } else {
      usernameErr('');
    }
  }

  void validatePassword() {
    if (password.text.isEmpty) {
      passwordErr('Mật khẩu không được để trống');
    } else {
      passwordErr('');
    }
  }
}
