import 'package:flutter/material.dart';

import 'feature/home/ui/MyHomePage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Prayer Schedule App', theme: ThemeData(primarySwatch: Colors.green), home: MyHomePage());
  }
}
