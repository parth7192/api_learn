import 'dart:convert';
import 'package:api_learn/modal/product_modal.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  ApiServices._();

  static final ApiServices apiServices = ApiServices._();

  String apiLink = "https://dummyjson.com/products";

  Future<List<Product>> initData() async {
    List<Product> products = <Product>[];
    http.Response response = await http.get(
      Uri.parse(apiLink),
    );
    if (response.statusCode == 200) {
      List product = jsonDecode(response.body)['products'];
      products = product.map((e) {
        return Product.fromJson(e);
      }).toList();
    }
    return products;
  }
}
