import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:pageview_with_newsapi/controller/HomeController.dart';
import 'package:pageview_with_newsapi/model/news_model.dart';
import 'package:pageview_with_newsapi/screens/customLoader.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(HomeController());
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => ModalProgressHUD(
        inAsyncCall: controller.isLoading.value,
        progressIndicator: CustomLoader(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Pager View'),
          ),
          body: homeSlider(),
        ),
      ),
    );
  }

  Widget homeSlider() {
    return PageView.builder(
        itemCount: controller.articleList.length,
        controller: _pageController,
        itemBuilder: (BuildContext context, int index) {
          return itemPager(context, index);
        },
        onPageChanged: (int index) {
          _currentPageNotifier.value = index;
        });
  }

  Widget itemPager(BuildContext context, int index) {
    Article item = controller.articleList[index];
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              imageWidget(item.urlToImage),
              _buildCircleIndicator(),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  'Author: ${item.title}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text('Source: ${item.source.name}'),
                Text('Description: ${item.description}')
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget imageWidget(String imageUrl) {
    if (imageUrl != null) {
      return Image.network(
        imageUrl,
        fit: BoxFit.fill,
        height: 300,
      );
    } else {
      return Image.asset(
        'assets/image/background_bg.png',
        height: 300,
      );
    }
  }

  _buildCircleIndicator() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CirclePageIndicator(
          itemCount: controller.articleList.length,
          currentPageNotifier: _currentPageNotifier,
        ),
      ),
    );
  }
}
