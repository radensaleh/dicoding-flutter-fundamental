import 'package:food_hub_app/data/models/restaurant.dart';
import 'package:food_hub_app/routes/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:food_hub_app/screens/screens.dart';

Map<String, WidgetBuilder> routesApp = {
  Routes.splashScreen: (_) => SplashScreen(),
  Routes.welcomeScreen: (_) => const WelcomeScreen(),
  Routes.loginScreen: (_) => const LoginScreen(),
  Routes.registerScreen: (_) => const RegisterScreen(),
  Routes.homeScreen: (_) => const HomeScreen(),
  Routes.restaurantDetailScreen: (_) => RestaurantDetailScreen(
        restaurants: ModalRoute.of(_)!.settings.arguments as Restaurant,
      ),
};
