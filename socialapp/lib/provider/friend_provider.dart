import 'package:get/get.dart';
import 'package:socialapp/commons.dart';
import 'package:socialapp/model/friend_data.dart';

import '../global.dart';

class FriendProvider extends GetConnect {
  Future<List<FriendData>> getListFriends(String userId) async {
    if (userId.isEmpty) {
      userId = storage.getString(KEY.idUser.toString())!;
    }

    final Response data = await get('$USER_API_URL/user/friends/$userId');
    if (data.statusCode == 200) {
      return (data.body as List).map((e) => FriendData.fromJson(e)).toList();
    } else {
      data.log('getListFriends');
      return [];
    }
  }
}
