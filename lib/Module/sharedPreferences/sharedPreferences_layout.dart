import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLayout extends StatefulWidget {
  const SharedPreferencesLayout({super.key});

  @override
  State<SharedPreferencesLayout> createState() =>
      _SharedPreferencesLayoutState();
}

class _SharedPreferencesLayoutState extends State<SharedPreferencesLayout> {
  TextEditingController nameController = TextEditingController();

  late SharedPreferences prefs;
  String? name;
  String? photo;
  final ImagePicker _picker = ImagePicker();
  File? imageFile;

  @override
  void initState() {
    super.initState();
    initprefs();
  }

  initprefs() async {
    prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name');
    photo = prefs.getString('photo');
    if (photo != null) {
      imageFile = File(await _saveTempImage(photo!));
    }
    setState(() {});
  }

  Future<String> _saveTempImage(String base64) async {
    final bytes = base64Decode(base64);
    final tempDir = Directory.systemTemp;
    final file = File('${tempDir.path}/temp_image.jpg');
    await file.writeAsBytes(bytes);
    return file.path;
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
      final bytes = await imageFile!.readAsBytes();
      photo = base64Encode(bytes);
      await prefs.setString('photo', photo!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // TEXT
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "Enter your name",
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                prefs.setString('name', name = nameController.text);
                name = prefs.getString('name');
                setState(() {});
              },
              child: const Text("Save"),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                "Name: ${name ?? ''}",
                style: const TextStyle(fontSize: 30),
              ),
            ),

            // PHOTO
            const SizedBox(height: 150),
            imageFile != null
                ? Image.file(
                    imageFile!,
                    height: 200,
                  )
                : const Center(
                    child: Text(
                      "No Image",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text("Pick Image"),
            ),
          ],
        ),
      ),
    );
  }
}
