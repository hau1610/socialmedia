import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialapp/utils/svg.dart';

class ImagePage extends StatelessWidget {
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: const Text('Album ảnh',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
              ),
              Expanded(
                child: GridView.count(
                    crossAxisSpacing: 5,
                    crossAxisCount: 3,
                    childAspectRatio: 1.5,
                    children: List.generate(
                        8,
                        (index) => const Image(
                              image: AssetImage(Picture.city),
                              fit: BoxFit.contain,
                            ))),
              ),
            ],
          ),
        ));
  }
}
