import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:socialapp/model/post_data.dart';
import 'package:socialapp/provider/post_provider.dart';

class EditPostController extends GetxController {
  final VoidCallback? onEditSuccess;
  final PostData postData;

  late final TextEditingController controller;
  late final RxString text;
  late final PostProvider postProvider;

  EditPostController({this.onEditSuccess, required this.postData});
  @override
  void onInit() {
    controller = TextEditingController(text: postData.desc);
    postProvider = PostProvider();
    text = ''.obs;

    super.onInit();
  }

  void onTextChange(String value) {
    text.value = value;
  }

  // Future<void> creatPost() async {
  //   final bool res = await postProvider.createPost(
  //       userId: storage.getString(KEY.idUser.toString())!, desc: text.value);
  //   if (res) {
  //     onEditSuccess?.call();
  //     Get.back();
  //     showNotification(
  //         NOTIFICATION_TYPE.success, 'Đăng bài', 'Đăng bài viết thành công');
  //   } else {
  //     showNotification(
  //         NOTIFICATION_TYPE.error, 'Đăng bài', 'Đăng bài viết thất bại');
  //   }
  // }
}
