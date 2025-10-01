import 'package:cryptocoins_list/crypto_coins_list_app.dart';
import 'package:cryptocoins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() {
  final talker = TalkerFlutter.init();

  // Регистрируем Talker
  GetIt.I.registerLazySingleton<Talker>(() => talker);

  // Проверим работу
  GetIt.I<Talker>().debug('Talker started');
  // GetIt.I<Talker>().error('Talker started');
  // GetIt.I<Talker>().info('Talker started');

  // Регистрируем репозиторий
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
    () => CryptoCoinRepository(dio: Dio()),
  );

  runApp(const CryptoCoinApp());
}
