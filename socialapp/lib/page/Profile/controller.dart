import 'package:get/get.dart';
import 'package:socialapp/model/friend_data.dart';
import 'package:socialapp/model/post_data.dart';
import 'package:socialapp/provider/friend_provider.dart';
import 'package:socialapp/provider/post_provider.dart';

class ProfileController extends GetxController {
  late final Rx<List<FriendData>> friendsList;
  late final FriendProvider friendProvider;
  late final Rx<List<PostData>> listPost;
  late final PostProvider _postProvider;

  @override
  void onInit() {
    friendsList = Rx<List<FriendData>>([]);
    friendProvider = FriendProvider();
    _postProvider = PostProvider();
    listPost = Rx<List<PostData>>([]);
    getMyPosts();
    getListFriends();
    super.onInit();
  }

  Future<void> getListFriends() async {
    final List<FriendData> data = await friendProvider.getListFriends();
    if (data.isNotEmpty) {
      friendsList.value = data;
    }
  }

  Future<void> getMyPosts() async {
    final List<PostData> listPostRes = await _postProvider.getMyPosts();
    if (listPostRes.isNotEmpty) {
      listPost(listPostRes);
    }
  }
}
