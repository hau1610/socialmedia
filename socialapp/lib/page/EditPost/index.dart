import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialapp/model/post_data.dart';
import 'package:socialapp/page/EditPost/controller.dart';
import 'package:socialapp/utils/svg.dart';

import '../../commons.dart';
import '../../global.dart';

class EditPost extends StatelessWidget {
  final PostData postData;
  final VoidCallback? onEditSuccess;

  const EditPost({Key? key, required this.postData, this.onEditSuccess})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    EditPostController c = Get.put(
        EditPostController(postData: postData, onEditSuccess: onEditSuccess));
    final Map<String, dynamic> userInfo =
        json.decode(storage.getString(KEY.loginData.toString())!);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sửa bài viết'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                    imageUrl: '$imageURL/${userInfo['avatar']}',
                    height: 50,
                    width: 50,
                    fit: BoxFit.contain,
                    placeholder: (ctx, s) => const Image(
                          image: AssetImage(Picture.noAvatar),
                          height: 50,
                          width: 50,
                          fit: BoxFit.contain,
                        ),
                    errorWidget: (ctx, s, d) => const Image(
                          image: AssetImage(Picture.noAvatar),
                          height: 50,
                          width: 50,
                          fit: BoxFit.contain,
                        )),
                const SizedBox(width: 10),
                Expanded(
                    child: Text(
                  userInfo['username'],
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                )),
              ],
            ),
            const SizedBox(height: 20),
            Container(
                height: 246,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.red)),
                child: TextField(
                  controller: c.controller,
                  onChanged: c.onTextChange,
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
                        EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 8),
                  ),
                )),
            const SizedBox(height: 40),
            GestureDetector(
              //  onTap: c.creatPost,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Sửa bài',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
