import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialapp/page/MyPost/controller.dart';
import 'package:socialapp/page/PostDetail/index.dart';
import 'package:socialapp/widgets/PostContainer/index.dart';

class MyPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyPostController c = Get.put(MyPostController());

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Đào Vĩnh Linh',
            style: TextStyle(),
          ),
        ),
        body: Stack(
          children: [
            Container(
              height: Get.height,
              width: Get.width,
              color: Colors.grey.withOpacity(0.3),
            ),
            Obx(() => ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (context, index) {
                    return PostContainer(data: c.listPost.value[index]);
                  },
                  itemCount: c.listPost.value.length,
                )),
          ],
        ));
  }
}
