import 'package:fruitcraft_bot_project/core/params/fruitbot_params.dart';
import 'package:fruitcraft_bot_project/features/fruitbot_feature/domain/entities/fruit_player_entity.dart';
import 'package:fruitcraft_bot_project/features/fruitbot_feature/domain/repositories/fruitbot_repository.dart';

class LoadPlayerInfoUsecase {
  final FruitbotRepository fruitbotRepository;

  LoadPlayerInfoUsecase(this.fruitbotRepository);

  Future<FruitPlayerEntity> call(LoadPlayerParams loadPlayerParams) async {
    return await fruitbotRepository.loadPlayerInfo(loadPlayerParams);
  }
}
