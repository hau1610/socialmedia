import 'package:get/get.dart';
import 'package:socialapp/commons.dart';
import 'package:socialapp/model/friend_data.dart';

import '../global.dart';

class FriendProvider extends GetConnect {
  Future<List<FriendData>> getListFriends() async {
    final Response data = await get(
        '$apiURL/user/friends/${storage.getString(KEY.idUser.toString())}');
    if (data.statusCode == 200) {
      return (data.body as List).map((e) => FriendData.fromJson(e)).toList();
    } else {
      data.log('login');
      return [];
    }
  }
}
