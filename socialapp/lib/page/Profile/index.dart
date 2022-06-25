import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:socialapp/page/FriendList/index.dart';
import 'package:socialapp/page/ImagePage/index.dart';
import 'package:socialapp/page/Profile/controller.dart';
import 'package:socialapp/utils/svg.dart';
import 'package:socialapp/widgets/PostContainer/index.dart';

import '../../commons.dart';
import '../../global.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController c = Get.put(ProfileController());
    final Map<String, dynamic> userInfo =
        json.decode(storage.getString(KEY.loginData.toString())!);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          userInfo['username'],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Image(
              height: 200,
              width: Get.width,
              image: const AssetImage(Picture.city),
              fit: BoxFit.cover,
            ),
          ),
          const Center(
            child: Baseline(
              baseline: 100,
              baselineType: TextBaseline.alphabetic,
              child: Image(
                height: 200,
                width: 200,
                image: AssetImage(Picture.logo_Aplus),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              userInfo['username'],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 40,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  SvgIcon.edit,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                const Text('Chỉnh sửa trang cá nhân',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            color: Colors.black.withOpacity(0.2),
            width: Get.width,
            height: 1,
          ),
          Row(
            children: [
              SvgPicture.asset(
                SvgIcon.homeIcon,
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 10),
              Text('Sống tại ${userInfo['city']}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ))
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              SvgPicture.asset(SvgIcon.liveIcon, width: 20, height: 20),
              const SizedBox(width: 10),
              Text('Đến từ ${userInfo['from']}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ))
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              SvgPicture.asset(
                SvgIcon.studyIcon,
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 10),
              const Text('Học tại',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ))
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: 30,
            decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Chỉnh sửa thông tin cá nhân',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.red))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            color: Colors.black.withOpacity(0.2),
            width: Get.width,
            height: 1,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Bạn bè',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )),
              Text('Tìm bạn bè',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.red)),
            ],
          ),
          const SizedBox(height: 20),
          Obx(() => SizedBox(
                height: c.friendsList.value.length <= 3 ? 125 : 250,
                child: GridView.count(
                    primary: false,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    children: List.generate(
                        c.friendsList.value.length <= 6
                            ? c.friendsList.value.length
                            : 6,
                        (index) => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Expanded(
                                    child: Image(
                                        image: AssetImage(Picture.logo_Aplus))),
                                const SizedBox(height: 3),
                                Text(c.friendsList.value[index].username ?? '',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600))
                              ],
                            ))),
              )),
          GestureDetector(
            onTap: () => Get.to(const FriendList()),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Xem tất cả bạn bè',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.red))
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            color: Colors.black.withOpacity(0.2),
            width: Get.width,
            height: 1,
          ),
          const Text('Bài viết',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              )),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Image(
                      height: 40,
                      width: 40,
                      image: AssetImage(Picture.logo_Aplus),
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.only(left: 25, right: 10),
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromRGBO(250, 250, 250, 1)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'What’s on your mind?',
                              style: TextStyle(
                                  color: Color.fromRGBO(157, 157, 157, 1)),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(SvgIcon.insert_photo_icon,
                                    height: 20, width: 20),
                                const SizedBox(width: 5),
                                SvgPicture.asset(SvgIcon.send_icon,
                                    height: 20, width: 20)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ))
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            color: Colors.black.withOpacity(0.2),
            width: Get.width,
            height: 1,
          ),
          const Text('Ảnh',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              )),
          const SizedBox(height: 20),
          Row(
            children: List.generate(
                3,
                (index) => Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: const Image(
                          image: AssetImage(Picture.city),
                          fit: BoxFit.contain,
                        ),
                      ),
                    )),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => Get.to(() => ImagePage()),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Xem tất cả ảnh',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.red))
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            color: Colors.black.withOpacity(0.2),
            width: Get.width,
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                c.listPost.value.length,
                (index) => PostContainer(data: c.listPost.value[index]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
