import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtolet/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function()? btnFunction;
  const CustomButton({super.key, required this.title, this.btnFunction});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: btnFunction,
      child: Text(title),
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.blackColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          minimumSize: Size(Get.width * 0.85, Get.height * 0.07)),
    );
  }
}
