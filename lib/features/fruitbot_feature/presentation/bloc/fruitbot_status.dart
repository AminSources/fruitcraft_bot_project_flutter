class FruitbotStatus {
  final BotStatus status;
  final BotAction action;

  FruitbotStatus({required this.status, required this.action});
}

enum BotStatus { initial, loading, success, failure }

enum BotAction { none, loadPlayerInfo, attack, collectGold }
