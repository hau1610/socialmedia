import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialapp/commons.dart';
import 'package:socialapp/global.dart';
import 'package:socialapp/provider/post_provider.dart';

class CreatePostController extends GetxController {
  late final RxBool showTextField;
  final VoidCallback? onCreateSuccess;
  late final Rx<String> pathImage;

  late final FocusNode focusNode;
  late final TextEditingController controller;
  late final RxString text;
  late final PostProvider postProvider;

  CreatePostController({this.onCreateSuccess});
  @override
  void onInit() {
    controller = TextEditingController();
    postProvider = PostProvider();
    text = ''.obs;
    focusNode = FocusNode();
    pathImage = RxString('');

    showTextField = false.obs;
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        if (text.value.trim().isEmpty) {
          showTextField.value = false;
        }
      } else {
        showTextField.value = true;
      }
    });
    super.onInit();
  }

  void onTextChange(String value) {
    text.value = value;
  }

  Future<void> showImagePicker(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final images = await _picker.pickImage(source: source);
    if (images != null) {
      pathImage(images.path);
    }
  }

  Future<void> creatPost() async {
    final bool res = await postProvider.createPost(
        userId: storage.getString(KEY.idUser.toString())!, desc: text.value);
    if (res) {
      onCreateSuccess?.call();
      Get.back();
      showNotification(
          NOTIFICATION_TYPE.success, 'Đăng bài', 'Đăng bài viết thành công');
    } else {
      showNotification(
          NOTIFICATION_TYPE.error, 'Đăng bài', 'Đăng bài viết thất bại');
    }
  }
}
