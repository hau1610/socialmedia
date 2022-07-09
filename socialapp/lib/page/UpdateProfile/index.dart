import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:socialapp/model/user_info.dart';
import 'package:socialapp/page/UpdateProfile/controller.dart';
import 'package:socialapp/utils/svg.dart';

import '../../commons.dart';
import '../../global.dart';

class UpdateProfile extends StatelessWidget {
  final VoidCallback? onCreateSuccess;
  final UserInfo data;

  const UpdateProfile({Key? key, required this.data, this.onCreateSuccess})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    UpdateProfileController c = Get.put(UpdateProfileController(data: data));
    final Map<String, dynamic> userInfo =
        json.decode(storage.getString(KEY.loginData.toString())!);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chỉnh sửa trang cá nhân'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Ảnh đại diện',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Chỉnh sửa',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Center(
            child: CachedNetworkImage(
                imageUrl: '$imageURL/${userInfo['avatar']}',
                height: 160,
                fit: BoxFit.contain,
                placeholder: (ctx, s) => const Image(
                      image: AssetImage(Picture.noAvatar),
                      height: 160,
                      fit: BoxFit.contain,
                    ),
                errorWidget: (ctx, s, d) => const Image(
                      image: AssetImage(Picture.noAvatar),
                      height: 160,
                      fit: BoxFit.contain,
                    )),
          ),
          const SizedBox(height: 20),
          const Text(
            'Ảnh bìa',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Center(
            child: CachedNetworkImage(
                imageUrl: '$imageURL/${userInfo['background']}',
                height: 160,
                fit: BoxFit.contain,
                placeholder: (ctx, s) => const Image(
                      image: AssetImage(Picture.noAvatar),
                      height: 160,
                      fit: BoxFit.contain,
                    ),
                errorWidget: (ctx, s, d) => const Image(
                      image: AssetImage(Picture.noAvatar),
                      height: 160,
                      fit: BoxFit.contain,
                    )),
          ),
          const SizedBox(height: 20),
          const Text(
            'Chi tiết',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              SvgPicture.asset(
                SvgIcon.homeIcon,
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 10),
              const Text('Sống tại :',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ))
            ],
          ),
          Container(
              height: 30,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.red)),
              child: TextField(
                controller: c.controller1,
                onChanged: c.onTextChange1,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                style: const TextStyle(fontSize: 15),
                decoration: const InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(top: 5, bottom: 0, left: 8, right: 8),
                ),
              )),
          const SizedBox(height: 10),
          Row(
            children: [
              SvgPicture.asset(
                SvgIcon.studyIcon,
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 10),
              const Text('Học tại :',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ))
            ],
          ),
          Container(
              height: 30,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.red)),
              child: TextField(
                controller: c.controller2,
                onChanged: c.onTextChange2,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                style: const TextStyle(fontSize: 15),
                decoration: const InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(top: 5, bottom: 0, left: 8, right: 8),
                ),
              )),
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            height: 45,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Cập nhật',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white)),
              ],
            ),
          ),
          const SizedBox(height: 30)
        ],
      ),
    );
  }
}
