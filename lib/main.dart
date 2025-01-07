import 'package:flutter/material.dart';
import 'package:shared_perferences_example/path_provider_example.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp()); // Entry point of the Flutter app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', // Application title
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), // Theme with deep purple color
        useMaterial3: true, // Material 3 design
      ),
      home: PathProviderExamplethProvider(), // Setting MyHomePage as the starting screen
    );
  }
}

