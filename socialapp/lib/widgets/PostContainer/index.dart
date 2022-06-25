import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:socialapp/model/post_data.dart';
import 'package:socialapp/page/PostDetail/index.dart';
import 'package:socialapp/utils/svg.dart';

class PostContainer extends StatelessWidget {
  final PostData data;
  const PostContainer({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String dateTime = data.createdAt?.split('T')[0] ?? '';
    return GestureDetector(
      onTap: () => Get.to(() => PostDetail(
            postData: data,
          )),
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  children: [
                    Text(
                      data.userId!,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(dateTime,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(157, 157, 157, 1)))
                  ],
                )),
                SvgPicture.asset(SvgIcon.option_icon, height: 25, width: 25)
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
                Row(
                  children: [
                    SvgPicture.asset(SvgIcon.like_icon, height: 15, width: 15),
                    const SizedBox(width: 7),
                    Text(
                      '${(data.likes?.length ?? 0).toString()} like',
                      style: const TextStyle(
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
    );
  }
}
