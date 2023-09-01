import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xtolet/constants/colors.dart';
import 'package:xtolet/constants/images.dart';
import 'package:xtolet/view/commonWidgets/custom_button.dart';
import 'package:xtolet/view/home_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.whiteColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.xtoletLogo),
            SizedBox(
              height: Get.height * 0.05,
            ),
            CustomText(
              text: "Welcome to Xtolet",
              txtStyle: customTextStyle.copyWith(fontSize: 20),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            CustomTextformField(
              hintText: "Email",
              txtController: TextEditingController(),
              borderRad: BorderRadius.circular(10),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            CustomTextformField(
              hintText: "Password",
              txtController: TextEditingController(),
              borderRad: BorderRadius.circular(10),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            CustomButton(
              title: "Login",
              btnFunction: () {},
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            CustomText(
              text: "Forgot Password?",
              txtStyle: customTextStyle.copyWith(
                  fontSize: 15, color: AppColor.lightBlue),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            CustomText(
              text: "Don't have an account?",
              txtStyle: customTextStyle.copyWith(fontSize: 15),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            CustomButton(
              title: "Sign Up",
              btnFunction: () {},
            ),
          ],
        ),
      ),
    );
  }
}
