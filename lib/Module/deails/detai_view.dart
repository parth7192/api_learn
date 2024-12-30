import 'package:api_learn/Module/deails/detail_layout.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DetailView extends StatefulWidget {
  static const routeName = 'DetailView';
  static const route = '/Detail';
  const DetailView({super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          return const DetailLayout();
        },
      ),
    );
  }
}