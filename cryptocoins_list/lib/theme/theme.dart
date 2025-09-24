import 'package:flutter/material.dart';

final darkTheme = ThemeData(
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
          elevation: 0,
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
      );