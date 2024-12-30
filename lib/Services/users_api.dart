import 'dart:convert';
import 'package:api_learn/controller/users_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UsersApi {
  UsersApi._();

  static final UsersApi instance = UsersApi._();

  final String dbName = "users";

  final String url = "https://jsonplaceholder.typicode.com/posts/1";

  Future<void> initData() async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final user = jsonDecode(response.body);
        UsersController.instance.user.value = user;

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(dbName, jsonEncode(user));
        Get.snackbar(
          "Success",
          "Data fetched and stored successfully.......",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
        );
      } else {
        Get.snackbar(
          "Error",
          "Failed to Load Data!!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "please check Your internet connection...!!!!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
