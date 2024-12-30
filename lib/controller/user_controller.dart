import 'package:api_learn/Services/user_api.dart';
import 'package:api_learn/modal/users_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  UserController() {
    initData();
  }

  RxList<Users> allUser = <Users>[].obs;
  Future<void> initData() async {
    allUser(await UserApi.instance.initData());
  }
}
