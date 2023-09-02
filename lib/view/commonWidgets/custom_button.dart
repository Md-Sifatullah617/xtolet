import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtolet/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final BorderRadius? borderRad;
  final Function()? btnFunction;
  final double? buttonWidth;
  final double? buttonHeight;
  final Widget? icon;
  const CustomButton(
      {super.key,
      required this.title,
      this.btnFunction,
      this.borderRad,
      this.icon,
      this.buttonWidth,
      this.buttonHeight});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: btnFunction,
      label: Text(title),
      icon: icon ?? Container(),
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.blackColor,
          shape: RoundedRectangleBorder(
              borderRadius: borderRad ?? BorderRadius.zero),
          minimumSize: Size(buttonWidth ?? Get.width * 0.85,
              buttonHeight ?? Get.height * 0.06)),
    );
  }
}
