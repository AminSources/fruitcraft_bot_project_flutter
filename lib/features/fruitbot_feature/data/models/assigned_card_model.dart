import 'package:fruitcraft_bot_project/features/fruitbot_feature/domain/entities/assigned_card_entity.dart';

class AssignedCardModel extends AssignedCardEntity {
  const AssignedCardModel({
    required super.id,
    required super.baseCardId,
    required super.playerId,
    required super.power,
    required super.lastUsedAt,
  });

  factory AssignedCardModel.fromJson(Map<String, dynamic> json) {
    return AssignedCardModel(
      id: json['id'] ?? 0,
      baseCardId: json['base_card_id'] ?? 0,
      playerId: json['player_id'] ?? 0,
      power: json['power'] ?? 0,
      lastUsedAt: json['last_used_at'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'base_card_id': baseCardId,
      'player_id': playerId,
      'power': power,
      'last_used_at': lastUsedAt,
    };
  }
}
