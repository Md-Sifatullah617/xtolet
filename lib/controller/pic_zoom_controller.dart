import 'package:get/get.dart';

class PictureController extends GetxController {
  RxInt zoomedIndex = (-1).obs;
  RxBool isZoomed(index) => zoomedIndex.value == index ? true.obs : false.obs;
}
