import 'package:fruitcraft_bot_project/core/params/fruitbot_params.dart';
import 'package:fruitcraft_bot_project/features/fruitbot_feature/domain/entities/fruit_player_entity.dart';

abstract class FruitbotRepository {
  //? fetch player info
  Future<FruitPlayerEntity> loadPlayerInfo(LoadPlayerParams loadPlayerParams);
}
