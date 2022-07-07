import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialapp/model/post_data.dart';
import 'package:socialapp/page/HomePage/controller.dart';
import 'package:socialapp/widgets/PostContainer/index.dart';

import '../../commons.dart';
import '../../global.dart';

class MyPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
        init: HomePageController(),
        builder: (c) {
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
                  ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (context, index) {
                      return Obx(
                          () => PostContainer(data: c.listMyPost.value[index]));
                    },
                    itemCount: c.listMyPost.value.length,
                  ),
                ],
              ));
        });
  }
}
