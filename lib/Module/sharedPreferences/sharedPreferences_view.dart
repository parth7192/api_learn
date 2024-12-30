import 'package:api_learn/Module/sharedPreferences/sharedPreferences_layout.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SharedPreferencesView extends StatefulWidget {
  static const routeName = 'SharedPreferencesView';
  static const route = '/SharedPreferences';
  const SharedPreferencesView({super.key});

  @override
  State<SharedPreferencesView> createState() => _SharedPreferencesViewState();
}

class _SharedPreferencesViewState extends State<SharedPreferencesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          return const SharedPreferencesLayout();
        },
      ),
    );
  }
}