import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_hub_app/routes/routes.dart';
import 'package:food_hub_app/utils/style.dart';

class SplashScreen extends StatelessWidget {
  final duration = const Duration(seconds: 3);
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  SplashScreen({Key? key}) : super(key: key) {
    handleOnInitialize();
  }

  void handleOnInitialize() async {
    Future.delayed(duration).then((_) {
      Navigator.pushNamed(
        _globalKey.currentState!.context,
        Routes.welcomeScreen,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: orangeColor,
      body: SafeArea(
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',
            height: 180,
          ),
        ),
      ),
    );
  }
}
