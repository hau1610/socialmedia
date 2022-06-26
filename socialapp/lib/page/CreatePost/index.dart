import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialapp/page/CreatePost/controller.dart';
import 'package:socialapp/utils/svg.dart';

import '../../commons.dart';
import '../../global.dart';

class CreatePost extends StatelessWidget {
  final VoidCallback? onCreateSuccess;

  const CreatePost({Key? key, this.onCreateSuccess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CreatePostController c =
        Get.put(CreatePostController(onCreateSuccess: onCreateSuccess));
    Map<String, dynamic> userInfo =
        json.decode(storage.getString(KEY.loginData.toString())!);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tạo bài viết'),
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
                const Image(
                  height: 40,
                  width: 40,
                  image: AssetImage(Picture.logo_Aplus),
                  fit: BoxFit.cover,
                ),
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
            Obx(() => c.showTextField.value == true
                ? Container(
                    height: 246,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.red)),
                    child: TextField(
                      controller: c.controller,
                      focusNode: c.focusNode,
                      onChanged: c.onTextChange,
                      autofocus: true,
                      maxLines: null,
                      expands: true,
                      textAlignVertical: TextAlignVertical.top,
                      style: const TextStyle(fontSize: 15),
                      decoration: const InputDecoration(
                        filled: true,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            top: 0, bottom: 0, left: 8, right: 8),
                      ),
                    ))
                : GestureDetector(
                    onTap: () {
                      c.showTextField.value = true;
                    },
                    child: Container(
                      height: 246,
                      color: const Color.fromRGBO(237, 243, 252, 1),
                      child: const Center(
                        child: Text('What\'s on your mind?',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(157, 157, 157, 1))),
                      ),
                    ),
                  )),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: c.creatPost,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Đăng bài',
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
