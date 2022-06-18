import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:socialapp/utils/svg.dart';

class Profile extends StatelessWidget {
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
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Image(
              height: 200,
              width: Get.width,
              image: AssetImage(Picture.city),
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
          const Center(
            child: Text(
              'Đào Vĩnh Linh',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
          const SizedBox(height: 20),
          Container(
            color: Colors.black.withOpacity(0.2),
            width: Get.width,
            height: 1,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              SvgPicture.asset(
                SvgIcon.homeIcon,
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 10),
              const Text('Sống tại Hà Nội',
                  style: TextStyle(
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
              const Text('Đến từ Hà Nội',
                  style: TextStyle(
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
          )
        ],
      ),
    );
  }
}
