import 'package:flutter/material.dart';
import 'package:plantapp/providers/shop_provider.dart';
import 'package:plantapp/ui/home/home_page.dart';
import 'package:plantapp/ui/root/root_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ShopProvider(),
          child: const HomePage(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RootPage(),
      ),
    );
  }
}
