
import 'package:cryptocoins_list/repositories/crypto_coins/models/crypto_coin.dart';

class CryptoCoinDetail extends CryptoCoin {
  const CryptoCoinDetail({
    required super.name,
    required super.priceInUSD,
    required super.imageUrl,
    required this.toSymbol,
    required this.lastUpdate,
    required this.hight24Hour,
    required this.low24Hours,
  });

  // TOSYMBOL
  final String toSymbol;

  // LASTUPDATE
  final DateTime lastUpdate;

  // HIGH24HOUR
  final double hight24Hour;

  // LOW24HOUR
  final double low24Hours;

  @override
  List<Object?> get props => super.props//? i add myself
    ..addAll([
      toSymbol,
      lastUpdate,
      hight24Hour,
      low24Hours,
    ]);
}
