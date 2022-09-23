import 'package:flutter/material.dart';
import 'package:food_hub_app/routes/register_routes.dart';
import 'utils/utils.dart';
import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Hub App',
      theme: lightTheme,
      initialRoute: Routes.splashScreen,
      routes: routesApp,
      debugShowCheckedModeBanner: false,
    );
  }
}
