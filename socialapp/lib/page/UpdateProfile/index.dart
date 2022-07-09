import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialapp/model/user_info.dart';
import 'package:socialapp/utils/svg.dart';

import '../../commons.dart';
import '../../global.dart';

class UpdateProfile extends StatelessWidget {
  final UserInfo data;

  const UpdateProfile({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Ảnh bìa',
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
          Text('Sống tại ${data.city}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              )),
          Text('Học tại ${data.from}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ))
        ],
      ),
    );
  }
}
