import 'package:get/get.dart';
import 'package:socialapp/model/friend_data.dart';
import 'package:socialapp/provider/friend_provider.dart';

class MenuController extends GetxController {
  late final Rx<List<FriendData>> friendsList;
  late final FriendProvider friendProvider;

  @override
  void onInit() {
    friendsList = Rx<List<FriendData>>([]);
    friendProvider = FriendProvider();
    getListFriends();
    super.onInit();
  }

  Future<void> getListFriends() async {
    final List<FriendData> data = await friendProvider.getListFriends('');
    if (data.isNotEmpty) {
      friendsList.value = data;
    }
  }
}
