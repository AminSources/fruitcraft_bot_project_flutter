import 'package:fruitcraft_bot_project/features/fruitbot_feature/domain/entities/card_entity.dart';

class CardModel extends CardEntity {
  const CardModel({
    required super.id,
    required super.baseCardId,
    required super.playerId,
    required super.power,
    required super.lastUsedAt,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json['id'] ?? 0,
      baseCardId: json['base_card_id'] ?? 0,
      playerId: json['player_id'] ?? 0,
      power: json['power'] ?? 0,
      lastUsedAt: json['last_used_at'] ?? 0,
    );
  }
}
