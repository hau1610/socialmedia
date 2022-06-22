import 'package:get/get.dart';
import 'package:socialapp/commons.dart';
import 'package:socialapp/model/user_info.dart';

class AccountProvider extends GetConnect {
  Future<UserInfo?> login(
    String username,
    String password,
  ) async {
    final Map<String, dynamic> params = {
      'email': username,
      'password': password,
    }.json;
    final Response data =
        await post('http://10.130.175.154:8800/api/auth/login', params);
    if (data.statusCode == 200) {
      return data.body != null ? UserInfo.fromJson(data.body) : UserInfo();
    } else {
      data.log('login');
      return UserInfo();
    }
  }
}
