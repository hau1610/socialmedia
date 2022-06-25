import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:socialapp/model/post_data.dart';
import 'package:socialapp/utils/svg.dart';
import 'package:socialapp/widgets/PostContainer/index.dart';

class PostDetail extends StatelessWidget {
  final PostData postData;

  const PostDetail({Key? key, required this.postData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          PostContainer(data: postData),
          postData.likes != null && postData.likes!.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.favorite,
                        size: 20,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 7),
                      Text(
                        '${postData.likes?[0] ?? ''} và ${postData.likes!.length - 1} người khác',
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                )
              : Container(),
          const SizedBox(height: 10),
          Column(
            children: List.generate(
                postData.comments?.length ?? 0,
                (index) => Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
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
                                postData.comments?[index].userId.toString() ??
                                    '',
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 5),
                              Text(postData.comments?[index].desc ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ))
                            ],
                          )),
                        ],
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
