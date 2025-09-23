
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coinName,
  });

  final String coinName;
 
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // <-- удобно держать ссылку
    return ListTile(
      leading: SvgPicture.asset(
        'assets/svg/bitcoin_logo.svg',
        height: 40,
        width: 40,
      ),
      title: Text(coinName, style: theme.textTheme.headlineLarge),
      subtitle: Text('5000/USD', style: theme.textTheme.labelSmall),
      trailing: Icon(Icons.arrow_forward_ios, size: theme.iconTheme.size),
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed('/coin', arguments: coinName);
      },
    );
  }
}