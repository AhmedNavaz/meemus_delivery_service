import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meemus_delivery_service/constants/controllers.dart';
import 'package:meemus_delivery_service/router_generator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => navigationController.getOffAll(loginRoute));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Meemus Delivery Service'),
      ),
    );
  }
}
