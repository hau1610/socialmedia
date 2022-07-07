import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:socialapp/page/CreatePost/index.dart';
import 'package:socialapp/page/HomePage/controller.dart';
import 'package:socialapp/page/Menu/index.dart';
import 'package:socialapp/page/Notification/index.dart';
import 'package:socialapp/page/Profile/index.dart';
import 'package:socialapp/utils/svg.dart';
import 'package:socialapp/widgets/PostContainer/index.dart';

import '../../commons.dart';
import '../../global.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomePageController h = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> userInfo =
        json.decode(storage.getString(KEY.loginData.toString())!);

    return GetBuilder<HomePageController>(
        init: HomePageController(),
        builder: (c) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text(
                'A Plus',
                style: TextStyle(color: Colors.red),
              ),
              leading: Container(
                margin: const EdgeInsets.only(left: 10),
                child: const Image(
                  height: 100,
                  width: 100,
                  image: AssetImage(Picture.logo_Aplus),
                  fit: BoxFit.cover,
                ),
              ),
              actions: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.05)),
                      child: SvgPicture.asset(
                        SvgIcon.search_icon,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => NotificationPage());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.05)),
                        child: SvgPicture.asset(SvgIcon.notification_icon,
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const Menu());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.05)),
                        child: const Icon(
                          Icons.menu_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            body: Stack(children: [
              Container(
                height: Get.height,
                width: Get.width,
                color: Colors.grey.withOpacity(0.3),
              ),
              ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: [
                  GestureDetector(
                    onTap: () => Get.to(CreatePost(
                      onCreateSuccess: h.getPosts,
                    )),
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Post something',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 11),
                          Container(
                            color: Colors.black.withOpacity(0.1),
                            height: 1,
                            width: Get.width,
                          ),
                          const SizedBox(height: 17),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () => Get.to(() => const Profile()),
                                child: Image.network(
                                  '$imageURL/${userInfo['avatar']}',
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                  child: Container(
                                padding:
                                    const EdgeInsets.only(left: 25, right: 10),
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color:
                                        const Color.fromRGBO(250, 250, 250, 1)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'What’s on your mind?',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(157, 157, 157, 1)),
                                    ),
                                  ],
                                ),
                              ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => Column(
                      children: List.generate(
                          h.listPost.value.length,
                          (index) =>
                              PostContainer(data: h.listPost.value[index])),
                    ),
                  )
                ],
              ),
            ])));
  }
}
