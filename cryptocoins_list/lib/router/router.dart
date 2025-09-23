
import 'package:cryptocoins_list/features/crypto_coin/crypto_coin.dart';
import 'package:cryptocoins_list/features/cryptol_list/view/crypto_list_screen.dart';


final routes = {
  '/': (context) => CryptoListApp(title: 'CryptoCoinApp'),
  '/coin': (context) => CryptoCoinScreen(),
};
