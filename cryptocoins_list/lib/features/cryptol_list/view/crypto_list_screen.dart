import 'package:cryptocoins_list/features/cryptol_list/widgets/widgets.dart';
import 'package:cryptocoins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CryptoListApp extends StatefulWidget {
  const CryptoListApp({super.key, required this.title});

  final String title;

  @override
  State<CryptoListApp> createState() => _CryptoListAppState();
}

class _CryptoListAppState extends State<CryptoListApp> {
  List<CryptoCoin>? _cryptoCoinsList;

  @override
  void initState(){
    _loadCryptoCoins();
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // <-- удобно держать ссылку
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: (_cryptoCoinsList == null)
            ? const CircularProgressIndicator(
                color: Colors.black,
                strokeWidth: 4,
              )
            : ListView.separated(
                padding: const EdgeInsets.only(top: 16),
                itemCount: _cryptoCoinsList!.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, i) {
                  final coin = _cryptoCoinsList![i];
                  return CryptoCoinTile(coin: coin);
                },
              ),
      ), // check
      
    );
  }

  Future<List<CryptoCoin>> _loadCryptoCoins() async =>
      _cryptoCoinsList = await GetIt.I<AbstractCoinsRepository>().getCoinsList();
}
