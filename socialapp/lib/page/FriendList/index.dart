import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:socialapp/utils/svg.dart';

class FriendList extends StatelessWidget {
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                '6 người bạn',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            Expanded(
                child: ListView(
                    padding: const EdgeInsets.all(10),
                    children: List.generate(
                        6,
                        (index) => Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Image(
                                  height: 60,
                                  width: 60,
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
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text('1 bạn chung',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            color: Color.fromRGBO(
                                                157, 157, 157, 1)))
                                  ],
                                )),
                                SvgPicture.asset(SvgIcon.option_icon,
                                    height: 25, width: 25)
                              ],
                            )))),
          ],
        ));
  }
}
