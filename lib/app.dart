import 'package:flutter/material.dart';
import 'package:gtx/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'task demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 31, 41, 0)),
        useMaterial3: false,
      ),
      home: HomeScreen(),
    );
  }
}
