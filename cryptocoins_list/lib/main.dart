import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const CryptoCoinApp());
}

class CryptoCoinApp extends StatelessWidget {
  const CryptoCoinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueGrey,
        primarySwatch: Colors.orange,
        textTheme: TextTheme(
          bodyMedium: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),

          labelSmall: const TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
      home: const MyHomePage(title: 'CryptoCoinApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(widget.title),
        leading: Icon(Icons.attach_money_sharp, size: 40),
      ),

      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, i) => ListTile(
          leading: SvgPicture.asset(
            'assets/svg/bitcoin_logo.svg',
            height: 50, // smaller height
            width:  50, // make width and height equal and smaller
          ),
          trailing: (Icon(Icons.check, size: 40,color: Colors.amber)),
          title: Text('KZT', style: Theme.of(context).textTheme.bodyMedium),
          subtitle: Text(
            '5000/USD',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      ),

    );
  }
}
