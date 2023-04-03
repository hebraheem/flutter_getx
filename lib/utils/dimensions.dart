import "package:get/get.dart";

class Dimensions {
  static double deviceHeight = Get.context!.height;
  static double deviceWidth = Get.context!.width;
  static bool isLandscape = Get.context!.isLandscape;
  // static double deviceHeight =
  //     isLandscape ? Get.context!.height / 2 : Get.context!.height;

  // device height =884
  // device width = 411.3
  // default icons size 24

  // factor determinant =  screen height / container height same for width

  static double pageViewContainerHeight = deviceHeight / 3.84;
  static double foodMainHeaderHeight = deviceHeight / 2.64;
  static double pageViewTextContainerHeight = deviceHeight / 7.03;

  static double pageViewContainerWidth = deviceWidth / 3.84;
  static double pageViewTextContainerWidth = deviceWidth / 3.84;

  //fonts
  static double font10 = deviceHeight / 84.4;
  static double font16 = deviceHeight / 52.75;
  static double font20 = deviceHeight / 42.20;

  //height
  static double height5 = deviceHeight / 168.8;
  static double height10 = deviceHeight / 84.4;
  static double height15 = deviceHeight / 56.26;
  static double height20 = deviceHeight / 42.20;
  static double height30 = deviceHeight / 28.13;

  // width
  static double width5 = deviceWidth / 82.6;
  static double width10 = deviceWidth / 41.13;
  static double width15 = deviceWidth / 27.24;
  static double width20 = deviceWidth / 20.57;
  static double width30 = deviceWidth / 13.71;

  // icons
  static double icon24 = deviceHeight / 35.17;
}
