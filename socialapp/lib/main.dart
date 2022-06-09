import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialapp/get_routes.dart';
import 'package:socialapp/global_controller.dart';

void main() {
  runApp(const SocialApp());
}

class SocialApp extends StatelessWidget {
  const SocialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(GlobalController());
    return GetMaterialApp(
        enableLog: true,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/homepage',
        getPages: AppRoutes.routes);
  }
}
