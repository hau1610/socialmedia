import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:socialapp/utils/svg.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 30,
          ),
        ),
        title: const Text(
          'Thông báo',
          style: TextStyle(
              color: Colors.black, fontSize: 26, fontWeight: FontWeight.w600),
        ),
        actions: [
          Container(
            height: 32,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(255, 75, 75, 1)),
            child: const Center(
              child: Text(
                'Xóa tất cả',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(SvgIcon.clockIcon),
                  const SizedBox(width: 25),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Bạn có thông báo mới',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      SizedBox(height: 8),
                      Text('Bạn có thông báo mới',
                          style: TextStyle(fontSize: 18)),
                    ],
                  )),
                  SvgPicture.asset(SvgIcon.option_icon),
                ],
              ),
            );
          }),
    );
  }
}
