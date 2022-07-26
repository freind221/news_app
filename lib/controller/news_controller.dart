import 'package:get/get.dart';
import 'package:news_app_full/models/news_model.dart';
import 'package:news_app_full/services/remote_services.dart';

class NewsController extends GetxController {
  var articlesList = <Articles>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchArticles();
    super.onInit();
  }

  void fetchArticles() async {
    isLoading(true);
    var articles = await RemoteService.getArticles();
    if (articles != null) {
      articlesList.value = articles;
    }
    isLoading(false);
  }
}
