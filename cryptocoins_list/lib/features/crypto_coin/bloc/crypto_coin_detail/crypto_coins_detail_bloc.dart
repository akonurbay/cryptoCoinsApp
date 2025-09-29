
import 'package:cryptocoins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'crypto_coins_detail_event.dart';
part 'crypto_coins_detail_state.dart';

class CryptoCoinDetailsBloc
    extends Bloc<CryptoCoinDetailsEvent, CryptoCoinDetailsState> {
  CryptoCoinDetailsBloc(this.coinsRepository)
      : super(const CryptoCoinDetailsState()) {
    on<LoadCryptoCoinDetails>(_load);
  }

  final AbstractCoinsRepository coinsRepository;

  Future<void> _load(
    LoadCryptoCoinDetails event,
    Emitter<CryptoCoinDetailsState> emit,
  ) async {
    try {
      if (state is! CryptoCoinDetailsLoaded) {
        emit(const CryptoCoinDetailsLoading());
      }

      final coinDetails =
          await coinsRepository.getCoinDetails(event.currencyCode);

      emit(CryptoCoinDetailsLoaded(coinDetails));
    } catch (e) {
      emit(CryptoCoinDetailsLoadingFailure(e));
    }
  }
}
