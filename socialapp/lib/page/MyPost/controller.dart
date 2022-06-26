import 'package:get/get.dart';
import 'package:socialapp/model/comment_data.dart';
import 'package:socialapp/model/post_data.dart';
import 'package:socialapp/provider/post_provider.dart';

class MyPostController extends GetxController {
  late final Rx<List<PostData>> listPost;
  late final Rx<CommentData> comments;
  late final PostProvider _postProvider;
  late final Rx<List<CommentData>> listComment;

  @override
  void onInit() {
    listComment = Rx<List<CommentData>>([]);
    _postProvider = PostProvider();
    listPost = Rx<List<PostData>>([]);
    comments = Rx<CommentData>(CommentData());
    getMyPosts();
    super.onInit();
  }

  Future<void> getMyPosts() async {
    final List<PostData> listPostRes = await _postProvider.getMyPosts();
    if (listPostRes.isNotEmpty) {
      listPost(listPostRes.reversed.toList());
    }
  }
}
