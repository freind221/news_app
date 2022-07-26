import 'package:get/get.dart';
import 'package:news_app_full/models/category_model.dart';

class CategoryController extends GetxController {
  var catagories = <CategorieModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() {
    var productResult = [
      CategorieModel(
          "World Affairs",
          "https://images.unsplash.com/photo-1502920514313-52581002a659?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8d29ybGQlMjBtYXB8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
          '/'),
      CategorieModel(
          "Apple News",
          "https://images.unsplash.com/photo-1590252973641-1352f1a8885e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGFwcGxlJTIwY29tcGFueXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
          '/apple')
    ];

    catagories.value = productResult;
  }
}
