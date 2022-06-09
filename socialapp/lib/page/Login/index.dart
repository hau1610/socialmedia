import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:socialapp/page/Login/controller.dart';
import 'package:socialapp/page/Register/index.dart';
import 'package:socialapp/utils/svg.dart';

class Login extends StatelessWidget {
  final bool isStackPage;

  const Login({Key? key, this.isStackPage = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LoginController c = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image(
                      height: 100,
                      width: 100,
                      image: AssetImage(Picture.logo_Aplus),
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('Chào mừng bạn quay trở lại',
                      style: TextStyle(
                        color: Color.fromRGBO(202, 1, 1, 1),
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      )),
                  const SizedBox(height: 20),
                  Text(
                    'Đăng nhập để tiếp tục sử dụng A Plus',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color.fromRGBO(62, 57, 53, 1)),
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Nhập số điện thoại',
                      helperText: '',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(SvgIcon.call_add_icon),
                      ),
                      hintStyle:
                          TextStyle(color: Colors.black.withOpacity(0.2)),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  Obx(
                    () => TextField(
                      obscureText: !c.showPassword.value,
                      decoration: InputDecoration(
                        hintText: 'Nhập mật khẩu',
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.2)),
                        helperText: '',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(SvgIcon.security_icon),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () => c.showPassword(!c.showPassword.value),
                          child: c.showPassword.value
                              ? Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: SvgPicture.asset(SvgIcon.eye_open_icon,
                                      height: 16, width: 16),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: SvgPicture.asset(
                                    SvgIcon.eye_close_icon,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 18,
                                height: 18,
                                child: Obx(
                                  () => Checkbox(
                                      value: c.savePassword.value,
                                      onChanged: c.savePassword),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Lưu mật khẩu',
                                style: TextStyle(
                                    color: Color.fromRGBO(33, 71, 48, 1),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                            ],
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Quên mật khẩu?',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(33, 71, 48, 1)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 54,
                    child: TextButton(
                      onPressed: null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'ĐĂNG NHẬP',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40))),
                    ),
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(height: 30),
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
                          text: 'Bạn chưa là thành viên của MobiAgri? ',
                          style: TextStyle(
                              color: Color.fromRGBO(62, 57, 53, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              decoration: TextDecoration.none)),
                      TextSpan(
                          text: 'Đăng ký',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => isStackPage
                                ? Get.back()
                                : Get.to(() => Register(isStackPage: true)),
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            decoration: TextDecoration.none,
                          ))
                    ])),
                  ),
                  const SizedBox(height: 30)
                ],
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
