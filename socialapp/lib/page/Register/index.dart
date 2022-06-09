import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:socialapp/page/Login/index.dart';
import 'package:socialapp/page/Register/controller.dart';
import 'package:socialapp/utils/svg.dart';

class Register extends StatelessWidget {
  final bool isStackPage;
  RegisterController c = Get.put(RegisterController());

  Register({Key? key, this.isStackPage = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: GestureDetector(
              onTap: () => Get.back(), child: const Icon(Icons.arrow_back))),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  Text('Đăng ký',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      )),
                  const SizedBox(height: 20),
                  const Text(
                    'Chỉ dành cho thuê bao Mobifone',
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    height: 48,
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: 'Nhập số điện thoại',
                        hintStyle:
                            TextStyle(color: Color.fromRGBO(227, 227, 227, 1)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                            value: c.isChecked.value,
                            onChanged: (bool? value) {
                              c.isChecked(value);
                            }),
                      ),
                      Expanded(
                          child: Text.rich(
                        TextSpan(text: 'Tôi đồng ý với các ', children: [
                          TextSpan(
                              text: 'Điều khoản của dịch vụ',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  fontSize: 14),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => {})
                        ]),
                        style: TextStyle(
                            color: Color.fromRGBO(89, 89, 89, 1),
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ))
                    ],
                  ),
                  const SizedBox(height: 60),
                  SizedBox(
                    height: 54,
                    child: Obx(() => TextButton(
                          onPressed: null,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'GỬI MÃ XÁC THỰC',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          style: TextButton.styleFrom(
                              backgroundColor: c.isChecked.value
                                  ? Colors.red
                                  : Colors.red.withOpacity(0.5),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40))),
                        )),
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Hoặc đăng nhập với',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(62, 57, 53, 1)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 2.0,
                                spreadRadius: 2.0,
                                offset: Offset(1.0, 1.0),
                              )
                            ]),
                        child: IconButton(
                            onPressed: null,
                            icon: SvgPicture.asset(SvgIcon.logo_fb)),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 56,
                        height: 56,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 2.0,
                                spreadRadius: 2.0,
                                offset: Offset(1.0, 1.0),
                              )
                            ]),
                        child: IconButton(
                            onPressed: null,
                            icon: SvgPicture.asset(SvgIcon.logo_gg)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: Text.rich(TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: 'Bạn là thành viên của MobiAgri? ',
                          style: TextStyle(
                              color: Color.fromRGBO(62, 57, 53, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              decoration: TextDecoration.none)),
                      TextSpan(
                          text: 'Đăng nhập',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => isStackPage
                                ? Get.back()
                                : Get.to(() => Login(isStackPage: true)),
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              decoration: TextDecoration.none))
                    ])),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
