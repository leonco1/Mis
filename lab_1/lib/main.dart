import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String studentIndex = '211169';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Распоред на испити',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(indexNumber: studentIndex),
    );
  }
}