import 'package:api_learn/controller/users_controller.dart';
import 'package:get/get.dart';

class UsersBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UsersController());
  }
}
