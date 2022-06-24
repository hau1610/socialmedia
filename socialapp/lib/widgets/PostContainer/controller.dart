import 'package:get/get.dart';
import 'package:socialapp/model/comment_data.dart';
import 'package:socialapp/provider/post_provider.dart';

class PostController extends GetxController {
  late final Rx<CommentData> comments;
  late final PostProvider _postProvider;
  final String? postId;

  PostController(this.postId);

  @override
  void onInit() {
    print(postId);
    _postProvider = PostProvider();
    comments = Rx<CommentData>(CommentData());
    getComment(postId!);
    super.onInit();
  }

  Future<void> getComment(String id) async {
    final CommentData commentRes = await _postProvider.getComments(id);
    comments(commentRes);
    (commentRes);
    comments(commentRes);
  }
}
