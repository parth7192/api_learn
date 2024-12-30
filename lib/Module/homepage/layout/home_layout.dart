import 'package:api_learn/controller/product_controller.dart';
import 'package:api_learn/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    ProductController p = Get.put(ProductController());

    UserController u = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Api Learning"),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: u.allUser.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 40,
                    width: double.infinity,
                    color: Colors.black38,
                    child: Center(
                        child: Text("User Age: ${u.allUser[index].age}",
                            style: const TextStyle(color: Colors.white))),
                  ),
                  const SizedBox(height: 5),
                  ListTile(
                    onTap: () {},
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(10)),
                    splashColor: Colors.purple.withOpacity(0.2),
                    leading: GestureDetector(
                      onTap: () {},
                      child: Image.network(
                        u.allUser[index].image,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(p.allProduct[index].title,
                        style:
                            const TextStyle(color: Colors.green, fontSize: 18)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${p.allProduct[index].price.toString()} \$",
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                            "${p.allProduct[index].discountPercentage.toString()}% Discount",
                            style: TextStyle(color: Colors.redAccent[200])),
                        Row(
                          children: [
                            Icon(Icons.star,
                                color: Colors.amber[500], size: 20),
                            Text(p.allProduct[index].rating.toString()),
                            const Spacer(),
                            Text(
                                "${p.allProduct[index].stock.toString()} Stock",
                                style:
                                    const TextStyle(color: Color(0xff474E93))),
                          ],
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        p.deleteProduct(index);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Text("Coin: ${u.allUser[index].crypto.coin}",
                      style:
                          const TextStyle(color: Colors.black, fontSize: 15)),
                  Text("User Email: ${u.allUser[index].email}",
                      style:
                          const TextStyle(color: Colors.black, fontSize: 22)),
                  Text("SKU: ${p.allProduct[index].sku}",
                      style: TextStyle(fontSize: 22)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
