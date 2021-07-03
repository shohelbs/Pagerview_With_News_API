import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pageview_with_newsapi/controller/splash_controller.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
  var splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Image.asset('assets/image/background_bg.png'),
          Center(
              child: Text(
            'Pager View',
            style: TextStyle(
                color: Colors.red,
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          )),
        ]),
      ),
    );
  }
}
