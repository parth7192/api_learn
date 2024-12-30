import 'package:api_learn/App/app_provider.dart';
import 'package:api_learn/Binding/users_binding.dart';
import 'package:api_learn/Module/Users/users_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "navigator");
final GlobalKey<ScaffoldMessengerState> globalScaffoldKey =
    GlobalKey<ScaffoldMessengerState>();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppProvider(),
        ),
      ],
      builder: (context, child) {
        return ScreenUtilInit(
          designSize: const Size(390, 873),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return GestureDetector(
              onTap: () {
                primaryFocus?.unfocus();
              },
              child: GetMaterialApp(
                // routerConfig: AppRoutes.router,
                home: UsersView(),
                initialBinding: UsersBinding(),
                debugShowCheckedModeBanner: false,
                scaffoldMessengerKey: globalScaffoldKey,
                title: "Api Learning",
                
              ),
            );
          },
        );
      },
    );
  }
}
