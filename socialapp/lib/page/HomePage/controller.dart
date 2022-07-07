import 'package:get/get.dart';
import 'package:socialapp/model/comment_data.dart';
import 'package:socialapp/model/post_data.dart';
import 'package:socialapp/provider/post_provider.dart';

import '../../commons.dart';
import '../../global.dart';

class HomePageController extends GetxController {
  late final Rx<List<PostData>> listPost;
  late final PostProvider _postProvider;
  late final Rx<List<CommentData>> listComment;
  late final Rx<List<PostData>> listMyPost;
  @override
  void onInit() {
    listMyPost = Rx<List<PostData>>([]);
    listComment = Rx<List<CommentData>>([]);
    _postProvider = PostProvider();
    listPost = Rx<List<PostData>>([]);
    getPosts();
    super.onInit();
  }

  Future<void> getPosts() async {
    final List<PostData> listPostRes = await _postProvider.getPosts();
    if (listPostRes.isNotEmpty) {
      listPost(listPostRes);
      listMyPost.value = [...listPost.value];
      listMyPost.value.removeWhere((element) =>
          element.userId != storage.getString(KEY.idUser.toString()));
    }
  }

  Future<void> deletePost(PostData data) async {
    final bool res = await _postProvider.deletePost(postId: data.sId!);
    if (res) {
      listPost.value.removeWhere((element) => element.sId == data.sId);
      listMyPost.value.removeWhere((element) => element.sId == data.sId);

      update();
      showNotification(
          NOTIFICATION_TYPE.success, 'Xóa bài', 'Xóa bài viết thành công');
    } else {
      showNotification(
          NOTIFICATION_TYPE.error, 'Xóa bài', 'Xóa bài viết thất bại');
    }
  }

  Future<void> likePost(PostData data) async {
    final bool res = await _postProvider.likePost(postId: data.sId!);
    if (res) {
      bool check =
          data.likes!.contains(storage.getString(KEY.idUser.toString()));
      if (check) {
        data.likes!.removeWhere(
            (element) => element == storage.getString(KEY.idUser.toString()));
      } else {
        data.likes!.add(storage.getString(KEY.idUser.toString())!);
      }
    }
    update();
  }
}
