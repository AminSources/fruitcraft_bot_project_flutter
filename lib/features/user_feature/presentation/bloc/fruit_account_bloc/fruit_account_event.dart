part of 'fruit_account_bloc.dart';

sealed class FruitAccountEvent extends Equatable {
  const FruitAccountEvent();

  @override
  List<Object> get props => [];
}

class AddFruitAccountEvent extends FruitAccountEvent {
  final FruitAccountParams fruitAccountParams;

  const AddFruitAccountEvent({required this.fruitAccountParams});
}

class ResetUserEvent extends FruitAccountEvent {}
