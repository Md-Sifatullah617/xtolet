import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:xtolet/constants/List.dart';
import 'package:xtolet/constants/colors.dart';
import 'package:xtolet/constants/images.dart';
import 'package:xtolet/controller/pic_zoom_controller.dart';
import 'package:xtolet/view/commonWidgets/custom_button.dart';
import 'package:xtolet/view/login_screen.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final picCtrl = Get.put(PictureController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.morelightBlue,
      appBar: AppBar(
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
          Stack(
            children: [
              Container(
                height: Get.height * 0.55,
              ),
              Image.asset(
                AppImages.coverimage,
                height: Get.height * 0.3,
                width: Get.width,
                fit: BoxFit.cover,
              ),
              Positioned(
                left: Get.width * 0.05,
                right: Get.width * 0.05,
                top: Get.height * 0.1,
                child: Container(
                  height: Get.height * 0.425,
                  width: Get.width * 0.9,
                  decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 20),
                            color: AppColor.greyColor,
                            spreadRadius: -10,
                            blurRadius: 15.0),
                        // BoxShadow(
                        //     offset: Offset(-1, -4),
                        //     color: AppColor.greyColor,
                        //     spreadRadius: 5,
                        //     blurRadius: 10.0)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        const CustomTextformField(
                          hintText: "Where do you want to live?",
                          borderRad: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        SizedBox(
                          height: Get.height * 0.005,
                        ),
                        const CustomTextformField(
                          hintText: "Apartments",
                        ),
                        SizedBox(
                          height: Get.height * 0.005,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextformField(
                                hintText: "Min Price",
                              ),
                            ),
                            SizedBox(
                              width: Get.height * 0.005,
                            ),
                            Expanded(
                              child: CustomTextformField(
                                hintText: "Max Price",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * 0.005,
                        ),
                        CustomTextformField(
                          hintText: "Male/Female",
                        ),
                        CustomButton(
                          title: "Search",
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
          CustomText(
            text: "Browse by category.",
            txtStyle: customTextStyle.copyWith(
                fontWeight: FontWeight.bold, fontSize: Get.width * 0.08),
          ),
          CustomText(
            text: "Find your dream house.",
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
          GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.9),
              itemCount: apartmentlist.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    picCtrl.zoompic.value = true;
                    Future.delayed(const Duration(seconds: 1),
                        () => picCtrl.zoompic.value = false);
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.width * 0.4,
                        width: Get.width * 0.4,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              100,
                            ),
                            child: Obx(() {
                              return picCtrl.zoompic.value
                                  ? ZoomIn(
                                      child: SvgPicture.asset(
                                        apartmentlist[index]["picture"],
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : SvgPicture.asset(
                                      apartmentlist[index]["picture"],
                                      fit: BoxFit.cover,
                                    );
                            })),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      CustomText(
                        text: apartmentlist[index]["title"],
                        txtStyle: customTextStyle.copyWith(fontSize: 15),
                      )
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? txtStyle;
  const CustomText({
    super.key,
    required this.text,
    this.txtStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: txtStyle ?? customTextStyle,
    );
  }
}

TextStyle customTextStyle = TextStyle(fontSize: Get.width * 0.045);

class CustomTextformField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? txtController;
  final BorderRadius? borderRad;
  const CustomTextformField({
    super.key,
    this.hintText,
    this.txtController,
    this.borderRad,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColor.blackColor,
      style: const TextStyle(
          decoration: TextDecoration.none, decorationThickness: 0),
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
              borderRadius: borderRad ?? BorderRadius.zero,
              borderSide: BorderSide.none),
          fillColor: AppColor.lightBlue,
          filled: true),
    );
  }
}
