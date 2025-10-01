import 'dart:async';

import 'package:cryptocoins_list/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:cryptocoins_list/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepository) : super(CryptoListInitial()) {
    on<LoadCryptoList>(_load);}


    final AbstractCoinsRepository coinsRepository;
    Future<void> _load(
      LoadCryptoList event,
      Emitter<CryptoListState> emit,
    ) async {
      try {
        if (state is! CryptoListLoaded) {
          emit(CryptoListLoading());
        }
        final coinsList = await coinsRepository.getCoinsList();
        throw Exception('Data not loaded');
        emit(CryptoListLoaded(coinsList: coinsList));
      } catch (e, st) {
        emit(CryptoListLoadingFailure(exeption: e));
        GetIt.I<Talker>().handle(e, st,'IDK' );
      } finally {
        event.completer?.complete();
      }
  }

}
