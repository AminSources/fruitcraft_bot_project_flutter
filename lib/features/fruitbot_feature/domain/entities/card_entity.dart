class CardEntity {
  final int id;
  final int baseCardId;
  final int playerId;
  final int power;
  final int lastUsedAt;

  const CardEntity({
    required this.id,
    required this.baseCardId,
    required this.playerId,
    required this.power,
    required this.lastUsedAt,
  });
}
