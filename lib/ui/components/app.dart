import 'package:flutter/material.dart';
import '../../ui/pages/pages.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TDD Clean Arch',
      debugShowCheckedModeBanner: false,
      home: LoginPage(null),
    );
  }
}
