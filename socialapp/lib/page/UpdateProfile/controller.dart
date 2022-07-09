import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialapp/model/user_info.dart';

import 'package:socialapp/provider/post_provider.dart';

import '../../commons.dart';
import '../../global.dart';

class UpdateProfileController extends GetxController {
  final VoidCallback? onCreateSuccess;
  late final Rx<String> pathImage;
  final UserInfo data;

  late final TextEditingController controller1;
  late final TextEditingController controller2;

  late final RxString text1;
  late final RxString text2;

  late final PostProvider postProvider;

  UpdateProfileController({this.onCreateSuccess, required this.data});
  @override
  void onInit() {
    controller1 = TextEditingController(text: data.city);
    controller2 = TextEditingController(text: data.from);

    postProvider = PostProvider();
    text1 = ''.obs;
    text2 = ''.obs;

    pathImage = RxString('');

    super.onInit();
  }

  void onTextChange1(String value) {
    text1.value = value;
  }

  void onTextChange2(String value) {
    text2.value = value;
  }

  Future<void> showImagePicker(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final images = await _picker.pickImage(source: source);
    if (images != null) {
      pathImage(images.path);
    }
  }

  Future<void> updateProfile() async {
    final bool res = await postProvider.updateProfile(
        storage.getString(KEY.idUser.toString())!, text1.value, text2.value);
    if (res) {
      onCreateSuccess?.call();
      Get.back();
      showNotification(NOTIFICATION_TYPE.success, 'Cập nhật',
          'Cập nhật bài viết thành công');
    } else {
      showNotification(
          NOTIFICATION_TYPE.error, 'Cập nhật', 'Cập nhật bài viết thất bại');
    }
  }
}
