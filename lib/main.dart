import 'package:flutter/material.dart';
import 'package:recipe_ui/recipe_onboarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home:RecipeOnboardingScreen(),
    );
  }
}
