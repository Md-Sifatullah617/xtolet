import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:xtolet/constants/colors.dart';
import 'package:xtolet/constants/images.dart';
import 'package:xtolet/view/commonWidgets/custom_button.dart';
import 'package:xtolet/view/home_page.dart';
import 'package:xtolet/view/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.morelightBlue,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: Get.height * 0.08,
          backgroundColor: AppColor.whiteColor,
          elevation: 0,
          title: SvgPicture.asset(
            AppImages.xtoletLogo,
            height: Get.height * 0.05,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => const LoginScreen());
              },
              icon: Icon(
                FontAwesomeIcons.user,
                color: AppColor.blackColor,
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            SizedBox(
              height: Get.height * 0.05,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.05, vertical: Get.height * 0.015),
              decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  CustomText(
                    text: "Sign In",
                    txtStyle: customTextStyle.copyWith(
                        fontSize: Get.width * 0.05,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                        text: "E-mail Address",
                        txtStyle: customTextStyle.copyWith(
                            fontSize: Get.width * 0.04)),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  CustomTextformField(
                    hintText: "example@gmail.com",
                    borderRad: BorderRadius.all(Radius.circular(10)),
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                        text: "Password",
                        txtStyle: customTextStyle.copyWith(
                            fontSize: Get.width * 0.04)),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  CustomTextformField(
                    hintText: "******",
                    borderRad: BorderRadius.all(Radius.circular(10)),
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  CustomButton(
                    title: "Login",
                    borderRad: BorderRadius.all(Radius.circular(10)),
                    btnFunction: () {},
                  ),
                  SizedBox(
                    height: Get.height * 0.025,
                  ),
                  CustomButton(
                    buttonHeight: Get.height * 0.055,
                    buttonWidth: Get.width * 0.6,
                    icon: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColor.whiteColor,
                          radius: Get.width * 0.045,
                          child: Icon(
                            FontAwesomeIcons.google,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.1,
                        ),
                        CustomText(
                          text: "Login with Google",
                          txtStyle: customTextStyle.copyWith(
                              fontSize: Get.width * 0.04),
                        ),
                      ],
                    ),
                    title: "",
                    btnFunction: () {},
                    borderRad: BorderRadius.all(Radius.circular(30)),
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                          text: "Don't have an account?",
                          txtStyle: customTextStyle.copyWith(
                              fontSize: Get.width * 0.04)),
                      SizedBox(
                        width: Get.width * 0.02,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(() => const SignUpScreen());
                          },
                          child: CustomText(
                            text: "Sign Up",
                            txtStyle: customTextStyle.copyWith(
                                color: AppColor.blackColor,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                fontSize: Get.width * 0.04),
                          )),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
