import 'package:get/get.dart';
import 'package:socialapp/page/HomePage/index.dart';
import 'package:socialapp/page/Login/index.dart';
import 'package:socialapp/page/Menu/index.dart';
import 'package:socialapp/page/Register/index.dart';

final routes = [
  GetPage(name: '/login', page: () => const Login()),
  GetPage(name: '/register', page: () => Register()),
  GetPage(name: '/homepage', page: () => HomePage()),
  GetPage(name: '/menu', page: () => const Menu()),
];

class Routes {
  static const String homepage = '/homepage';
  static const String login = '/login';
  static const String menu = '/menu';
}
