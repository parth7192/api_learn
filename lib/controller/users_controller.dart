import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersController extends GetxController {
  static UsersController get instance => Get.find<UsersController>();
  final String dbName = "users";

  RxMap<String, dynamic> user = <String, dynamic>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    String data = prefs.getString(dbName) ?? "{}";
    user.value = jsonDecode(data);
  }

  Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(dbName);
    user.value = {};
  }
}
