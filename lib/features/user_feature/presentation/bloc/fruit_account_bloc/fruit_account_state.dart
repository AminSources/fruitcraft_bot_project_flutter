part of 'fruit_account_bloc.dart';

class FruitAccountState {
  final FruitAccountStatus fruitAccountStatus;

  FruitAccountState({required this.fruitAccountStatus});

  FruitAccountState copyWith({FruitAccountStatus? fruitAccountStatus}) {
    return FruitAccountState(
      fruitAccountStatus: fruitAccountStatus ?? this.fruitAccountStatus,
    );
  }
}
