import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xtolet/constants/colors.dart';
import 'package:xtolet/constants/images.dart';
import 'package:xtolet/view/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => MyHomePage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColor.whiteColor,
        child: BounceInUp(child: SvgPicture.asset(AppImages.xtoletLogo)));
  }
}
