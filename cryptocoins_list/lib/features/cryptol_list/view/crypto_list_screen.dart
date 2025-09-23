


import 'package:cryptocoins_list/features/cryptol_list/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
          return const CryptoCoinTile(coinname: coinname);
        },
      ),
    );
  }
}

