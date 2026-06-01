import 'package:fruitcraft_bot_project/core/params/login_params.dart';
import 'package:fruitcraft_bot_project/core/params/register_params.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/domain/entities/auth_entity.dart';

abstract class AuthRepository {
  //? fetch login
  Future<AuthEntity> login(LoginParams loginParams);

  //? fetch register
  Future<AuthEntity> register(RegisterParams registerParams);
}
