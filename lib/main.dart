import 'package:flutter/material.dart';
import 'package:plantapp/ui/login/login_page.dart';
import 'package:plantapp/ui/root/root_page.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RootPage(),
    );
  }
}
