import 'package:flutter/material.dart';

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
        leading: Icon(Icons.attach_money_sharp, size: 40,)
      ),
      
      body: Center(
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
