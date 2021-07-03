import 'dart:async';

import 'package:get/get.dart';
import 'package:pageview_with_newsapi/screens/home_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Timer(Duration(seconds: 3), () => Get.off(() => HomeScreen()));
    super.onInit();
  }
}
