import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:socialapp/page/FriendList/index.dart';
import 'package:socialapp/page/ImagePage/index.dart';
import 'package:socialapp/page/MyPost/index.dart';
import 'package:socialapp/page/Profile/index.dart';
import 'package:socialapp/utils/svg.dart';

import '../../commons.dart';
import '../../get_routes.dart';
import '../../global.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menu',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.black.withOpacity(0.01),
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Get.to(() => Profile()),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Image(
                    height: 40,
                    width: 40,
                    image: AssetImage(Picture.logo_Aplus),
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Dao Vinh Linh',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text('Xem trang cá nhân của bạn',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color.fromRGBO(157, 157, 157, 1)))
                    ],
                  )),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              color: Colors.black.withOpacity(0.1),
              width: Get.width,
              height: 1,
            ),
            const SizedBox(height: 15),
            const Text(
              'Tất cả lối tắt',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            Expanded(
                child: GridView.count(
                    primary: false,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    children: [
                  GestureDetector(
                    onTap: () => Get.to(() => MyPost()),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            SvgIcon.feedIcon,
                            color: Colors.red,
                          ),
                          const SizedBox(height: 8),
                          const Text('Bài đăng',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(FriendList()),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            SvgIcon.friendIcon,
                            color: Colors.red,
                          ),
                          const SizedBox(height: 8),
                          const Text('Bạn bè',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => ImagePage()),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(SvgIcon.photoIcon,
                              color: Colors.red),
                          const SizedBox(height: 8),
                          const Text('Ảnh',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(SvgIcon.chatIcon),
                        const SizedBox(height: 8),
                        const Text('Nhắn tin',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600))
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(SvgIcon.settingIcon,
                            color: Colors.red),
                        const SizedBox(height: 8),
                        const Text('Cài đặt',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600))
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      for (var element in KEY.values) {
                        // if (element != KEY.FIRST_LOGIN_BY_PHONE &&
                        //     element != KEY.FIRST_OPEN) {
                        storage.remove(element.toString());
                        //}
                      }

                      Get.offAllNamed(Routes.login);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(SvgIcon.logoutIcon,
                              color: Colors.red),
                          const SizedBox(height: 8),
                          const Text('Đăng xuất',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                  ),
                ]))
          ],
        ),
      ),
    );
  }
}
