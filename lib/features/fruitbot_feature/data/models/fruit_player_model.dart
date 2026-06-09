import 'package:fruitcraft_bot_project/features/fruitbot_feature/data/models/assigned_card_model.dart';
import 'package:fruitcraft_bot_project/features/fruitbot_feature/data/models/card_model.dart';
import 'package:fruitcraft_bot_project/features/fruitbot_feature/domain/entities/fruit_player_entity.dart';

class FruitPlayerModel extends FruitPlayerEntity {
  const FruitPlayerModel({
    required super.playerId,
    required super.name,
    required super.level,
    required super.xp,
    required super.gold,
    required super.nectar,
    required super.potionNum,
    required super.potionPrice,
    required super.totalQuests,
    required super.totalBattles,
    required super.loseBattle,
    required super.wonBattle,
    required super.leagueRank,
    required super.leagueRemainingTime,
    required super.rank,
    required super.weeklyScore,
    required super.restoreKey,
    required super.heroMaxRarity,
    required super.defPower,
    required super.cards,
    required super.bankAccountBalance,
    required super.goldCollectionAllowed,
    required super.goldCollectionAllowedAt,
    required super.goldCollectionExtraction,
    required super.goldBuildingAssignedCards,
    required super.offenseBuildingAssignedCards,
    required super.auctionBuildingAssignedCards,
    required super.defenseBuildingAssignedCards,
  });

  factory FruitPlayerModel.fromJson(Map<String, dynamic> json) {
    return FruitPlayerModel(
      playerId: json['player_id'] ?? 0,
      name: json['name'] ?? '',
      level: json['level'] ?? 0,
      xp: json['xp'] ?? 0,
      gold: json['gold'] ?? 0,
      nectar: json['nectar'] ?? 0,
      potionNum: json['potion_num'] ?? 0,
      potionPrice: json['potion_price'] ?? 0,
      totalQuests: json['total_quests'] ?? 0,
      totalBattles: json['total_battles'] ?? 0,
      loseBattle: json['lose_battle'] ?? 0,
      wonBattle: json['won_battle'] ?? 0,
      leagueRank: json['league_rank'] ?? 0,
      leagueRemainingTime: json['league_remaining_time'] ?? 0,
      rank: json['rank'] ?? 0,
      weeklyScore: json['weekly_score'] ?? 0,
      restoreKey: json['restore_key'] ?? '',
      heroMaxRarity: json['hero_max_rarity'] ?? 0,
      defPower: json['def_power'] ?? 0,
      cards: (json['cards'] as List<dynamic>? ?? [])
          .map((e) => CardModel.fromJson(e))
          .toList(),
      bankAccountBalance: json['bank_account_balance'] ?? 0,
      goldCollectionAllowed: json['gold_collection_allowed'] ?? false,
      goldCollectionAllowedAt: json['gold_collection_allowed_at'] ?? 0,
      goldCollectionExtraction: json['gold_collection_extraction'] ?? 0,

      goldBuildingAssignedCards:
          (json['gold_building_assigned_cards'] as List<dynamic>? ?? [])
              .map((e) => AssignedCardModel.fromJson(e))
              .toList(),

      offenseBuildingAssignedCards:
          (json['offense_building_assigned_cards'] as List<dynamic>? ?? [])
              .map((e) => AssignedCardModel.fromJson(e))
              .toList(),

      auctionBuildingAssignedCards:
          (json['auction_building_assigned_cards'] as List<dynamic>? ?? [])
              .map((e) => AssignedCardModel.fromJson(e))
              .toList(),

      defenseBuildingAssignedCards:
          (json['defense_building_assigned_cards'] as List<dynamic>? ?? [])
              .map((e) => AssignedCardModel.fromJson(e))
              .toList(),
    );
  }
}
