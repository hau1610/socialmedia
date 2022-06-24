import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socialapp/commons.dart';
import 'package:socialapp/get_routes.dart';
import 'package:socialapp/global.dart';
import 'package:socialapp/global_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  storage = await SharedPreferences.getInstance();
  final String? userData = storage.getString(KEY.loginData.toString());
  if (userData != null) {
    isLoggedIn = true;
  }

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
        initialRoute: isLoggedIn ? Routes.homepage : Routes.login,
        getPages: routes);
  }
}
