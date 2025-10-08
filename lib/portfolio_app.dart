import 'package:flutter/material.dart';

import 'portfolio_home.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mohammad Nashawi — Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.cyanAccent,
        scaffoldBackgroundColor: const Color(0xFF071024),
        textTheme: Typography.whiteCupertino.apply(fontFamily: 'Inter'),
        useMaterial3: true,
      ),
      home: const PortfolioHome(),
    );
  }
}
