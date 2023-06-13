import 'package:flutter/material.dart';

import 'bottom_nav_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  BottomNav(),
    );
  }
}

