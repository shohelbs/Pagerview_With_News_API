import 'package:get/get.dart';
import 'package:pageview_with_newsapi/model/news_model.dart';
import 'package:pageview_with_newsapi/network/newHelper.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  int currentPage = 0;
  List<Article> articleList = [];

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    NewsHelper().callNewAPI().then((news) => {_addOnList(news)});
  }

  _addOnList(News news) {
    isLoading.value = false;
    if (news != null) {
      articleList.assignAll(news.articles);
      update();
    }
  }

  updateSelectedPage(int index) {
    currentPage = index;
    update();
  }
}
