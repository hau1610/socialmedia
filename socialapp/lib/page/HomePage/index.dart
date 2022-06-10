import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:socialapp/page/Notification/index.dart';
import 'package:socialapp/utils/svg.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'A Plus',
            style: TextStyle(color: Colors.red),
          ),
          leading: Container(
            margin: const EdgeInsets.only(left: 10),
            child: Image(
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
                  padding: EdgeInsets.all(5),
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
                    padding: EdgeInsets.all(5),
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
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Post something',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
                        Image(
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
                                Text(
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
              const SizedBox(height: 10),
              Column(
                children: List.generate(
                  4,
                  (index) => Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              height: 40,
                              width: 40,
                              image: AssetImage(Picture.logo_Aplus),
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dao Vinh Linh',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text('12 April at 09:28 PM',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color:
                                            Color.fromRGBO(157, 157, 157, 1)))
                              ],
                            )),
                            SvgPicture.asset(SvgIcon.option_icon,
                                height: 25, width: 25)
                          ],
                        ),
                        const SizedBox(height: 17),
                        Text(
                          'One of the perks of weeking in an international compony is sharing knowledge with your colleagues.',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(0, 0, 0, 1)),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          color: Colors.black.withOpacity(0.1),
                          height: 1,
                          width: Get.width,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(SvgIcon.comment_icon,
                                    height: 15, width: 15),
                                const SizedBox(width: 7),
                                Text(
                                  '100 Comments',
                                  style: TextStyle(
                                      color: Color.fromRGBO(105, 105, 105, 1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(SvgIcon.like_icon,
                                    height: 15, width: 15),
                                const SizedBox(width: 7),
                                Text(
                                  '100 Likes',
                                  style: TextStyle(
                                      color: Color.fromRGBO(105, 105, 105, 1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(SvgIcon.share_icon,
                                    height: 15, width: 15),
                                const SizedBox(width: 7),
                                Text(
                                  '100 Share',
                                  style: TextStyle(
                                      color: Color.fromRGBO(105, 105, 105, 1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ]));
  }
}
