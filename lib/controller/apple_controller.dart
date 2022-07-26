import 'package:get/get.dart';
import 'package:news_app_full/models/apple_model.dart';
import 'package:news_app_full/services/apple_service.dart';

class AppleController extends GetxController {
  var appleNews = <Article>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchArticles();
    super.onInit();
  }

  void fetchArticles() async {
    isLoading(true);
    var articles = await RemoteAppleService.getAppleNews();
    if (articles != null) {
      appleNews.value = articles;
    }
    isLoading(false);
  }
}
