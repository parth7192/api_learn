import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DetailLayout extends StatefulWidget {
  const DetailLayout({super.key});

  @override
  State<DetailLayout> createState() => _DetailLayoutState();
}

class _DetailLayoutState extends State<DetailLayout> {
  var jsonList;
  final dio = Dio();
  Future<void> getData() async {
    try {
      var response = await dio.get("https://dummyjson.com/products");
      if (response.statusCode == 200) {
        setState(() {
          jsonList = response.data['products'] as List;
        });
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
    }
  }

  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(jsonList[index]['title']),
                  tileColor: Colors.black12,
                  subtitle: Text(jsonList[index]['description']),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          NetworkImage(jsonList[index]['thumbnail']),
                      backgroundColor: Colors.black12,
                    ),
                    Text(jsonList[index]['price'].toString()),
                    Text(jsonList[index]['category'].toString()),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: jsonList == null ? 0 : jsonList.length,
      ),
    );
  }
}
