import 'package:cryptocoins_list/features/cryptol_list/bloc/crypto_list_bloc.dart';
import 'package:cryptocoins_list/features/cryptol_list/widgets/widgets.dart';
import 'package:cryptocoins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CryptoListApp extends StatefulWidget {
  const CryptoListApp({super.key, required this.title});

  final String title;

  @override
  State<CryptoListApp> createState() => _CryptoListAppState();
}

class _CryptoListAppState extends State<CryptoListApp> {
  
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // <-- удобно держать ссылку
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),

      body:
          BlocBuilder <CryptoListBloc, CryptoListState>(
            bloc: _cryptoListBloc,
            builder: (context, state) {

              if (state is CryptoListLoaded){
 return ListView.separated(
              padding: const EdgeInsets.only(top: 16),
              itemCount: state.coinsList.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, i) {
                final coin = state.coinsList[i];
                return CryptoCoinTile(coin: coin);
              },
            );
              }
              return const Center (child: CircularProgressIndicator());
            },
    )
          
          // (_cryptoCoinsList == null)
          // ? const CircularProgressIndicator(color: Colors.black, strokeWidth: 4)
         

      // check
    );
  }
}
