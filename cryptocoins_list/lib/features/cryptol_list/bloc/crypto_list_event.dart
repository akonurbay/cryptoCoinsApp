part of 'crypto_list_bloc.dart';

abstract class CryptoListEvent extends Equatable{}

class LoadCryptoList extends CryptoListEvent {
  LoadCryptoList([this.completer]);
  final Completer<void>? completer;
  
  @override
  List<Object?> get props => [completer];
}

