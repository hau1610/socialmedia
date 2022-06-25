import 'package:get/get.dart';
import 'package:socialapp/model/comment_data.dart';
import 'package:socialapp/model/post_data.dart';
import 'package:socialapp/provider/post_provider.dart';

class HomePageController extends GetxController {
  late final Rx<List<PostData>> listPost;
  late final PostProvider _postProvider;
  late final Rx<List<CommentData>> listComment;

  @override
  void onInit() {
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
    }
  }
}
