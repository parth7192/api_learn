import 'dart:convert';
import 'package:api_learn/modal/users_model.dart';
import 'package:http/http.dart' as http;

class UserApi {
  UserApi._();
  static UserApi instance = UserApi._();

  String apiLink = "https://dummyjson.com/users";

  Future<List<Users>> initData() async {
    List<Users> users = <Users>[];
    http.Response response = await http.get(
      Uri.parse(apiLink),
    );
    if (response.statusCode == 200) {
      List user = jsonDecode(response.body)['users'];
      users = user.map((e) => Users.fromJson(e)).toList();
    }
    return users;
  }
}
