import 'package:flutter/material.dart';
import 'package:meemus_delivery_service/constants/controllers.dart';
import 'package:meemus_delivery_service/router_generator.dart';
import 'controllers/navigation_controller.dart';
import 'package:get/get.dart';

void main() {
  Get.put(NavigationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      onGenerateRoute: RouteGenerator.onGeneratedRoutes,
      navigatorKey: navigationController.navigationKey,
    );
  }
}
