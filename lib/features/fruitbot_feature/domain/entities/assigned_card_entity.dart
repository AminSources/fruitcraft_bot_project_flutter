import 'package:equatable/equatable.dart';

class AssignedCardEntity extends Equatable {
  final int id;
  final int baseCardId;
  final int playerId;
  final int power;
  final int lastUsedAt;

  const AssignedCardEntity({
    required this.id,
    required this.baseCardId,
    required this.playerId,
    required this.power,
    required this.lastUsedAt,
  });

  @override
  List<Object?> get props => [id, baseCardId, playerId, power, lastUsedAt];
}
