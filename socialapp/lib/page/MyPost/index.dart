import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:socialapp/utils/svg.dart';

class MyPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Đào Vĩnh Linh',
          style: TextStyle(),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
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
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Text('12 April at 09:28 PM',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(157, 157, 157, 1)))
                      ],
                    )),
                    SvgPicture.asset(SvgIcon.option_icon, height: 25, width: 25)
                  ],
                ),
                const SizedBox(height: 17),
                const Text(
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
                        const Text(
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
                        const Text(
                          "100 Likes",
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
                          "100 Share",
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
          );
        },
        itemCount: 7,
      ),
    );
  }
}
