part of 'fruitbot_bloc.dart';

sealed class FruitbotEvent extends Equatable {
  const FruitbotEvent();

  @override
  List<Object> get props => [];
}

class LoadPlayerInfoEvent extends FruitbotEvent {
  final LoadPlayerParams loadPlayerParams;

  const LoadPlayerInfoEvent({required this.loadPlayerParams});
}
