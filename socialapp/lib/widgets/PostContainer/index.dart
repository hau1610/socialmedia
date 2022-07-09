import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:socialapp/commons.dart';
import 'package:socialapp/global.dart';
import 'package:socialapp/model/post_data.dart';
import 'package:socialapp/page/HomePage/controller.dart';
import 'package:socialapp/page/PostDetail/index.dart';
import 'package:socialapp/utils/svg.dart';
import 'package:socialapp/widgets/CustomDropdown/index.dart';

class PostContainer extends StatelessWidget {
  final PostData data;
  final bool isDetail;
  const PostContainer({
    Key? key,
    required this.data,
    this.isDetail = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> userInfo =
        json.decode(storage.getString(KEY.loginData.toString())!);
    HomePageController h = Get.find();
    final String dateTime = data.createdAt?.split('T')[0] ?? '';
    return GetBuilder<HomePageController>(
        init: HomePageController(),
        builder: (c) => GestureDetector(
              onTap: () => Get.to(() => PostDetail(
                    postData: data,
                  )),
              child: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                            // onTap: () => Get.to(() => const Profile()),
                            child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: CachedNetworkImage(
                              imageUrl: data.user!.avatar!.isNotEmpty
                                  ? '$imageURL/${data.user?.avatar}'
                                  : '',
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
                        )),
                        const SizedBox(width: 20),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.user?.username ?? '',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Text(dateTime,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(157, 157, 157, 1)))
                          ],
                        )),
                        if (storage.getString(KEY.idUser.toString()) ==
                            data.userId)
                          CustomDropdown<String>(
                            onTapItem: (value, index) {
                              h.deletePost(data);
                              if (isDetail) {
                                Get.back();
                              }
                            },
                            itemBuilder: (String data, int i) => Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Row(
                                children: [
                                  if (i == 0)
                                    SvgPicture.asset(
                                      SvgIcon.edit,
                                      color: Colors.black,
                                    )
                                  else
                                    const Icon(Icons.delete, size: 20),
                                  const SizedBox(width: 3),
                                  Text(
                                    data,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            items: const ['Xóa bài viết'],
                            child: SvgPicture.asset(SvgIcon.option_icon,
                                height: 25, width: 25),
                          )
                      ],
                    ),
                    const SizedBox(height: 17),
                    Text(
                      data.desc!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      color: Colors.black.withOpacity(0.1),
                      height: 1,
                      width: Get.width,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(SvgIcon.comment_icon,
                                height: 15, width: 15),
                            const SizedBox(width: 7),
                            Text(
                              '${data.comments?.length ?? 0} comments',
                              style: const TextStyle(
                                  color: Color.fromRGBO(105, 105, 105, 1),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            h.likePost(data);
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(SvgIcon.like_icon,
                                  height: 15, width: 15),
                              const SizedBox(width: 7),
                              Text(
                                '${(data.likes?.length ?? 0).toString()} like',
                                style: const TextStyle(
                                    color: Color.fromRGBO(105, 105, 105, 1),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ));
  }
}
