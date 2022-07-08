import 'package:get/get.dart';
import 'package:socialapp/model/friend_data.dart';
import 'package:socialapp/model/post_data.dart';
import 'package:socialapp/model/user_info.dart';
import 'package:socialapp/provider/friend_provider.dart';
import 'package:socialapp/provider/post_provider.dart';

class ProfileController extends GetxController {
  late final Rx<List<FriendData>> friendsList;
  late final FriendProvider friendProvider;
  late final Rx<List<PostData>> listPost;
  late final Rx<UserInfo> userInfo;
  late final PostProvider _postProvider;
  final FriendData? friendData;

  ProfileController(this.friendData);

  @override
  void onInit() {
    userInfo = Rx<UserInfo>(UserInfo());
    friendsList = Rx<List<FriendData>>([]);
    friendProvider = FriendProvider();
    _postProvider = PostProvider();
    listPost = Rx<List<PostData>>([]);
    getUserInfo(friendData?.sId ?? '');
    getMyPosts(friendData?.username ?? '');
    getListFriends(friendData?.sId ?? '');
    super.onInit();
  }

  Future<void> getListFriends(String userId) async {
    final List<FriendData> data = await friendProvider.getListFriends(userId);
    if (data.isNotEmpty) {
      friendsList.value = data;
    }
  }

  Future<void> getUserInfo(String userId) async {
    final UserInfo data = await _postProvider.getUserInfo(userId);
    userInfo.value = data;
  }

  Future<void> getMyPosts(String userName) async {
    final List<PostData> listPostRes = await _postProvider.getMyPosts(userName);
    if (listPostRes.isNotEmpty) {
      listPost(listPostRes);
    }
  }
}
