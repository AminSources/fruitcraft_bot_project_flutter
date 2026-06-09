part of 'fruitbot_bloc.dart';

class FruitbotState {
  final FruitbotStatus status;
  final FruitPlayerEntity? playerInfo;
  final String? errorMessage;

  FruitbotState({required this.status, this.playerInfo, this.errorMessage});

  FruitbotState copyWith({
    FruitbotStatus? status,
    FruitPlayerEntity? playerInfo,
    String? errorMessage,
  }) {
    return FruitbotState(
      status: status ?? this.status,
      playerInfo: playerInfo,
      errorMessage: errorMessage,
    );
  }
}
