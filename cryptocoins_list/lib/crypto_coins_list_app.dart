
import 'package:cryptocoins_list/router/router.dart';
import 'package:cryptocoins_list/theme/theme.dart';
import 'package:flutter/material.dart';

class CryptoCoinApp extends StatelessWidget {
  const CryptoCoinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoCoinApp',
      theme: darkTheme,
      routes: routes,
    );
  }
}