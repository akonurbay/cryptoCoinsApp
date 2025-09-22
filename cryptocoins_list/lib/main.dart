import 'dart:math' hide log;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:developer';

void main() {
  runApp(const CryptoCoinApp());
}

class CryptoCoinApp extends StatelessWidget {
  const CryptoCoinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoCoinApp',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueGrey,

        // Основная цветовая палитра
        primarySwatch: Colors.orange,
        dividerTheme: const DividerThemeData(color: Colors.white),

        // AppBar стили
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.orange,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 25,
          ),
          iconTheme: IconThemeData(color: Colors.white, size: 30),
        ),

        // Стили для ListTile
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.white,
          textColor: Colors.white,
        ),

        // Тексты
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          bodyMedium: TextStyle(color: Colors.white, fontSize: 20),
          labelSmall: TextStyle(color: Colors.white, fontSize: 15),
        ),

        // Иконки
        iconTheme: const IconThemeData(color: Colors.white, size: 25),
      ),
      routes: {
        '/': (context) => CryptoListApp(title: 'CryptoCoinApp'),
        '/coin': (context) => CryptoCoinScreen(),
      },
      //home: const CryptoListApp(title: 'CryptoCoinApp'),
    );
  }
}

class CryptoListApp extends StatefulWidget {
  const CryptoListApp({super.key, required this.title});

  final String title;

  @override
  State<CryptoListApp> createState() => _CryptoListAppState();
}

class _CryptoListAppState extends State<CryptoListApp> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // <-- удобно держать ссылку
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Icon(Icons.attach_money_sharp, size: theme.iconTheme.size),
      ),
      body: ListView.separated(
        itemCount: 20,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, i) {
          const coinname = 'project';
          return ListTile(
            leading: SvgPicture.asset(
              'assets/svg/bitcoin_logo.svg',
              height: 40,
              width: 40,
            ),
            title: Text(coinname, style: theme.textTheme.headlineLarge),
            subtitle: Text('5000/USD', style: theme.textTheme.labelSmall),
            trailing: Icon(Icons.arrow_forward_ios, size: theme.iconTheme.size),
            onTap: () {
              Navigator.of(
                context,
              ).pushNamed('/coin', arguments: coinname);
            },
          );
        },
      ),
    );
  }
}

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String? coinname;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null) {
      log('you must provide args!!!');
      return;
    }
    if (args is! String) {
      log('you must provide String args!!!');
      return;
    }
    coinname = args;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(coinname ?? '...')));
  }
}
