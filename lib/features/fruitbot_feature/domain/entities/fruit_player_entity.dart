import 'package:equatable/equatable.dart';
import 'package:fruitcraft_bot_project/features/fruitbot_feature/domain/entities/assigned_card_entity.dart';
import 'package:fruitcraft_bot_project/features/fruitbot_feature/domain/entities/card_entity.dart';

class FruitPlayerEntity extends Equatable {
  final int playerId;
  final String name;
  final int level;
  final int xp;
  final int gold;
  final int nectar;
  final int potionNum;
  final int potionPrice;
  final int totalQuests;
  final int totalBattles;
  final int loseBattle;
  final int wonBattle;
  final int leagueRank;
  final int leagueRemainingTime;
  final int rank;
  final int weeklyScore;
  final String restoreKey;
  final int heroMaxRarity;
  final int defPower;
  final List<CardEntity> cards;
  final int bankAccountBalance;
  final bool goldCollectionAllowed;
  final int goldCollectionAllowedAt;
  final int goldCollectionExtraction;

  final List<AssignedCardEntity> goldBuildingAssignedCards;
  final List<AssignedCardEntity> offenseBuildingAssignedCards;
  final List<AssignedCardEntity> auctionBuildingAssignedCards;
  final List<AssignedCardEntity> defenseBuildingAssignedCards;

  const FruitPlayerEntity({
    required this.playerId,
    required this.name,
    required this.level,
    required this.xp,
    required this.gold,
    required this.nectar,
    required this.potionNum,
    required this.potionPrice,
    required this.totalQuests,
    required this.totalBattles,
    required this.loseBattle,
    required this.wonBattle,
    required this.leagueRank,
    required this.leagueRemainingTime,
    required this.rank,
    required this.weeklyScore,
    required this.restoreKey,
    required this.heroMaxRarity,
    required this.defPower,
    required this.cards,
    required this.bankAccountBalance,
    required this.goldCollectionAllowed,
    required this.goldCollectionAllowedAt,
    required this.goldCollectionExtraction,
    required this.goldBuildingAssignedCards,
    required this.offenseBuildingAssignedCards,
    required this.auctionBuildingAssignedCards,
    required this.defenseBuildingAssignedCards,
  });

  @override
  List<Object?> get props => [
    playerId,
    name,
    level,
    xp,
    gold,
    nectar,
    potionNum,
    potionPrice,
    totalQuests,
    totalBattles,
    loseBattle,
    wonBattle,
    leagueRank,
    leagueRemainingTime,
    rank,
    weeklyScore,
    restoreKey,
    heroMaxRarity,
    defPower,
    cards,
    bankAccountBalance,
    goldCollectionAllowed,
    goldCollectionAllowedAt,
    goldCollectionExtraction,
    goldBuildingAssignedCards,
    offenseBuildingAssignedCards,
    auctionBuildingAssignedCards,
    defenseBuildingAssignedCards,
  ];
}
