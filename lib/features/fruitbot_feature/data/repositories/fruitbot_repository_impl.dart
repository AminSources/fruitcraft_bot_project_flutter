import 'package:dio/dio.dart';
import 'package:fruitcraft_bot_project/core/params/fruitbot_params.dart';
import 'package:fruitcraft_bot_project/core/resources/app_exception.dart';
import 'package:fruitcraft_bot_project/core/services/logger.dart';
import 'package:fruitcraft_bot_project/features/fruitbot_feature/data/data_source/remote/fruitbot_api_provider.dart';
import 'package:fruitcraft_bot_project/features/fruitbot_feature/data/models/fruit_player_model.dart';
import 'package:fruitcraft_bot_project/features/fruitbot_feature/domain/entities/fruit_player_entity.dart';
import 'package:fruitcraft_bot_project/features/fruitbot_feature/domain/repositories/fruitbot_repository.dart';

class FruitbotRepositoryImpl extends FruitbotRepository {
  FruitbotApiProvider fruitbotApiProvider;

  FruitbotRepositoryImpl(this.fruitbotApiProvider);

  @override
  Future<FruitPlayerEntity> loadPlayerInfo(
    LoadPlayerParams loadPlayerParams,
  ) async {
    try {
      //? call load player api provider method
      final response = await fruitbotApiProvider.loadPlayerInfo(
        loadPlayerParams,
      );

      logger.d(response.data);

      //* parse data to entity
      final player = FruitPlayerModel.fromJson(response.data["profile"]);
      logger.d(player);
      return player;
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      final errorMessage = e.response?.data["message"];

      if (statusCode == 400) {
        throw AppException(errorMessage);
      }

      if (statusCode == 403) {
        throw AppException(errorMessage);
      }

      if (statusCode == 500) {
        throw AppException(errorMessage);
      }

      if (statusCode == null) {
        throw AppException(errorMessage);
      }

      throw AppException("Server error: $statusCode");
    } on AppException {
      rethrow;
    } catch (e) {
      throw AppException(e.toString());
    }
  }
}
