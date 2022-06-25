import 'dart:convert';

import 'package:get/get.dart';
import 'package:socialapp/commons.dart';
import 'package:socialapp/global.dart';
import 'package:socialapp/model/comment_data.dart';
import 'package:socialapp/model/post_data.dart';

class PostProvider extends GetConnect {
  Future<List<PostData>> getPosts() async {
    final String? userId = storage.getString(KEY.idUser.toString());

    final Response data = await get('$apiURL/post/timeline/$userId');

    if (data.statusCode == 200) {
      return data.body != null
          ? (data.body as List).map((e) => PostData.fromJson(e)).toList()
          : [];
    } else {
      data.log('Get home feed');
      return [];
    }
  }

  Future<List<PostData>> getMyPosts() async {
    Map<String, dynamic> userInfo =
        json.decode(storage.getString(KEY.loginData.toString())!);

    final Response data =
        await get('$apiURL/post/profile/${userInfo['username']}');

    if (data.statusCode == 200) {
      return data.body != null
          ? (data.body as List).map((e) => PostData.fromJson(e)).toList()
          : [];
    } else {
      data.log('Get profile feed');
      return [];
    }
  }

  Future<CommentData> getComments(String id) async {
    final Response data = await get('$apiURL/comment/$id');

    if (data.statusCode == 200) {
      return data.body != null
          ? CommentData.fromJson(data.body)
          : CommentData();
    } else {
      data.log('Get comment');
      return CommentData();
    }
  }
}
