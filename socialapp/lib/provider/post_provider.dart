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

  Future<bool> createPost(
      {required String userId, required String desc}) async {
    final Map<String, dynamic> params = {
      'userId': userId,
      'desc': desc,
    }.json;
    final Response data = await post('$apiURL/post', params);
    if (data.statusCode == 200) {
      return data.body != null ? true : false;
    } else {
      data.log('createPost');
      return false;
    }
  }

  Future<bool> deletePost({required String postId}) async {
    final Map<String, dynamic> params = {
      'userId': storage.getString(KEY.idUser.toString()),
    }.json;
    final Response data = await post('$apiURL/post/delete/$postId', params);
    if (data.statusCode == 200) {
      return data.body != null ? true : false;
    } else {
      data.log('deletePost');
      return false;
    }
  }

  Future<bool> likePost({required String postId}) async {
    final Map<String, dynamic> params = {
      'userId': storage.getString(KEY.idUser.toString()),
    }.json;
    final Response data = await put('$apiURL/post/$postId/like', params);
    if (data.statusCode == 200) {
      return data.body != null ? true : false;
    } else {
      data.log('likePost');
      return false;
    }
  }
}
