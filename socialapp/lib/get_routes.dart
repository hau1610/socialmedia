import 'package:get/get.dart';
import 'package:socialapp/page/HomePage/index.dart';
import 'package:socialapp/page/Login/index.dart';
import 'package:socialapp/page/Register/index.dart';

mixin AppRoutes {
  static final routes = [
    GetPage(name: '/login', page: () => Login()),
    GetPage(name: '/register', page: () => Register()),
    GetPage(name: '/homepage', page: () => HomePage()),
  ];
}
