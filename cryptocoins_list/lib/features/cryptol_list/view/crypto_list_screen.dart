import 'package:cryptocoins_list/features/cryptol_list/widgets/widgets.dart';
import 'package:cryptocoins_list/repositories/crypto_coins/crypto_coin_repository.dart';
import 'package:cryptocoins_list/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:flutter/material.dart';

class CryptoListApp extends StatefulWidget {
  const CryptoListApp({super.key, required this.title});

  final String title;

  @override
  State<CryptoListApp> createState() => _CryptoListAppState();
}

class _CryptoListAppState extends State<CryptoListApp> {
  List<CryptoCoin>? _cryptoCoinsList;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // <-- удобно держать ссылку
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Icon(Icons.attach_money_sharp, size: theme.iconTheme.size),
      ),
      body: (_cryptoCoinsList == null)
          ? const SizedBox()
          : ListView.separated(
              itemCount: _cryptoCoinsList!.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, i) {
                final coin = _cryptoCoinsList![i];
                final coinName = coin.name;
                return  CryptoCoinTile(coinName: coinName);
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: const Icon(Icons.download, color: Colors.black, size: 40),

        onPressed: () async {
          _cryptoCoinsList = await CryptoCoinRepository().getCoinsList();
          setState(() {});
        },
      ),
    );
  }
}
