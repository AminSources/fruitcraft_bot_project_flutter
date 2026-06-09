import 'package:dio/dio.dart';
import 'package:fruitcraft_bot_project/core/params/fruit_account_params.dart';
import 'package:fruitcraft_bot_project/core/resources/app_exception.dart';
import 'package:fruitcraft_bot_project/core/services/logger.dart';
import 'package:fruitcraft_bot_project/features/user_feature/data/data_source/remote/user_api_provider.dart';
import 'package:fruitcraft_bot_project/features/user_feature/data/models/user_model.dart';
import 'package:fruitcraft_bot_project/features/user_feature/domain/entities/user_entity.dart';
import 'package:fruitcraft_bot_project/features/user_feature/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  //* initialize user api provider
  UserApiProvider userApiProvider = UserApiProvider();

  UserRepositoryImpl(this.userApiProvider);

  @override
  Future<UserEntity> fetchProfile(String token) async {
    try {
      //? call fetch profile api provider method
      final response = await userApiProvider.profile(token);

      logger.d(response.data);

      //* parse data to entity
      final user = UserModel.fromJson(response.data);
      return user;
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      final errorMessage = e.response?.data["message"];

      if (statusCode == 400) {
        throw AppException(errorMessage);
      }

      if (statusCode == 401) {
        throw AppException(errorMessage);
      }

      if (statusCode == 404) {
        throw AppException(errorMessage);
      }

      if (statusCode == null) {
        throw AppException(errorMessage);
      }

      throw AppException("Server error: $statusCode");
    } on AppException {
      rethrow;
    } catch (e) {
      logger.e("FETCH PROFILE ERROR TYPE: ${e.runtimeType}");
      logger.e("FETCH PROFILE ERROR: $e");

      rethrow;
    }
  }

  @override
  Future<String> addFruitAccount(FruitAccountParams fruitAccountParams) async {
    try {
      //? call add fruit account api provider method
      final response = await userApiProvider.addFruitAccount(
        fruitAccountParams,
      );

      return response.data["message"];
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      final errorMessage = e.response?.data["message"];

      if (statusCode == 400) {
        throw AppException(errorMessage);
      }

      if (statusCode == 401) {
        throw AppException(errorMessage);
      }

      if (statusCode == 422) {
        throw AppException("Token is invalid");
      }

      if (statusCode == null) {
        throw AppException(errorMessage);
      }

      throw AppException("Server error: $statusCode");
    } on AppException {
      rethrow;
    } catch (e) {
      logger.e("ADD FRUIT ACCOUNT ERROR TYPE: ${e.runtimeType}");
      logger.e("ADD FRUIT ACCOUNT ERROR: $e");

      rethrow;
    }
  }
}
