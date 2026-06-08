import 'package:dio/dio.dart';
import 'package:fruitcraft_bot_project/core/params/login_params.dart';
import 'package:fruitcraft_bot_project/core/params/register_params.dart';
import 'package:fruitcraft_bot_project/core/resources/app_exception.dart';
import 'package:fruitcraft_bot_project/core/services/logger.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/data/data_source/remote/auth_api_provider.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/data/models/token_model.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/domain/entities/auth_entity.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  //* initialize auth api provider
  AuthApiProvider authApiProvider = AuthApiProvider();

  AuthRepositoryImpl(AuthApiProvider authApiProvider);

  @override
  Future<AuthEntity> login(LoginParams loginParams) async {
    try {
      //? call login api provider method
      final response = await authApiProvider.login(loginParams);

      //* parse data to entity
      final user = AuthModel.fromJson(response.data);
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
      logger.e("LOGIN ERROR TYPE: ${e.runtimeType}");
      logger.e("LOGIN ERROR: $e");

      rethrow;
    }
  }

  @override
  Future<AuthEntity> register(RegisterParams registerParams) async {
    try {
      //? call register api provider method
      final response = await authApiProvider.register(registerParams);

      //* parse data to entity
      final user = AuthModel.fromJson(response.data);
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

      if (statusCode == null) {
        throw AppException(errorMessage);
      }

      throw AppException("Server error: $statusCode");
    } on AppException {
      rethrow;
    } catch (e) {
      logger.e("Register ERROR TYPE: ${e.runtimeType}");
      logger.e("Register ERROR: $e");

      rethrow;
    }
  }
}
