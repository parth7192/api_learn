import 'package:api_learn/Services/api_service.dart';
import 'package:api_learn/modal/product_modal.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  ProductController() {
    initData();
  }

  RxList<Product> cartProduct = <Product>[].obs;
  RxBool isLoading = true.obs;

  RxList<Product> allProduct = <Product>[].obs;

  Future<void> initData() async {
    allProduct(await ApiServices.apiServices.initData());
    isLoading(false);
  }

  void deleteProduct(int index) {
    allProduct.removeAt(index);
    isLoading(false);
  } 
}
