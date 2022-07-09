import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:socialapp/model/friend_data.dart';
import 'package:socialapp/page/HomePage/controller.dart';
import 'package:socialapp/page/Profile/index.dart';
import 'package:socialapp/utils/svg.dart';

import '../../commons.dart';

class FriendList extends StatelessWidget {
  final bool isProfile;
  final List<FriendData> data;
  const FriendList({Key? key, required this.data, this.isProfile = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageController h = Get.find();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: GestureDetector(
              onTap: isProfile
                  ? () {
                      Get.back();
                      Get.to(() => Profile());
                    }
                  : () {
                      Get.back();
                    },
              child: Icon(Icons.arrow_back, color: Colors.white)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                    hintText: 'Tìm kiếm bạn bè',
                    helperText: '',
                    hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.3),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 20,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                '${data.length} người bạn',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            Expanded(
                child: ListView(
                    padding: const EdgeInsets.all(10),
                    children: List.generate(
                        data.length,
                        (index) => GestureDetector(
                              onTap: () {
                                Get.to(() => Profile(
                                      data: data[index],
                                      isRoot: false,
                                    ));
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: CachedNetworkImage(
                                        imageUrl:
                                            '$imageURL/${data[index].avatar}',
                                        height: 50,
                                        width: 50,
                                        fit: BoxFit.contain,
                                        placeholder: (ctx, s) => const Image(
                                              image:
                                                  AssetImage(Picture.noAvatar),
                                              height: 50,
                                              width: 50,
                                              fit: BoxFit.contain,
                                            ),
                                        errorWidget: (ctx, s, d) => const Image(
                                              image:
                                                  AssetImage(Picture.noAvatar),
                                              height: 50,
                                              width: 50,
                                              fit: BoxFit.contain,
                                            )),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                      child: Text(
                                    '${data[index].username}',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  )),
                                  SvgPicture.asset(SvgIcon.option_icon,
                                      height: 25, width: 25)
                                ],
                              ),
                            )))),
          ],
        ));
  }
}
