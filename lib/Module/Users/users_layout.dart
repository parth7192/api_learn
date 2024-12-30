import 'package:api_learn/controller/users_controller.dart';
import 'package:api_learn/Services/users_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersLayout extends GetView<UsersController> {
  const UsersLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ApiCall"),
        actions: [
          IconButton(
            onPressed: () => UsersApi.instance.initData(),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Obx(
        () {
          final user = controller.user;
          if (user.isEmpty) {
            return const Center(child: Text("No data available."));
          }
          return Center(
            child: Column(
              children: [
                ListTile(
                  leading: Text(
                    user['userId'].toString(),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(user['title'],
                        style: TextStyle(fontSize: 22, color: Colors.green)),
                  ),
                  subtitle: Text(user['body']),
                  trailing: Text(user['id'].toString()),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    controller.clearData();
                  },
                  child: const Text(
                    "Clear",
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
