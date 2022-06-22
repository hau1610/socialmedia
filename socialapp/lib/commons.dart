import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';

const String apiURL = 'http://localhost:8800/api';
enum KEY { idUser, password, saveAccount, loginData }
enum NOTIFICATION_TYPE { success, error }

extension DataExtention on Response {
  void log(String name) {
    print('======================$name======================\n$body');
  }
}

extension MapExtention<K, V> on Map<K, V> {
  Map<K, V> get json => validateNull(this);
}

Map<K, V> validateNull<K, V>(Map<K, V> value) {
  value.removeWhere(
      (key, value) => key == null || value == null || value == 'null');
  return value;
}

extension ObjectExtention on Object {
  void logExc(String name) {
    print('======================Exception_$name======================\n$this');
  }
}

void showNotification(NOTIFICATION_TYPE type,
    [String? title, String? notification]) {
  final notificationColor = {
    NOTIFICATION_TYPE.success: Colors.green,
    NOTIFICATION_TYPE.error: Colors.red,
  };

  Get.rawSnackbar(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
      snackPosition: SnackPosition.TOP,
      borderRadius: 8,
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: notificationColor[type]!,
      messageText: Text(
        notification?.tr ?? '',
        style: const TextStyle(color: Colors.white),
      ));
}
