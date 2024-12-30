import 'package:api_learn/Module/Users/users_layout.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class UsersView extends StatefulWidget {
  static const routeName = 'UsersView';
  static const route = '/Users';
  const UsersView({super.key});

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          return const UsersLayout();
        },
      ),
    );
  }
}