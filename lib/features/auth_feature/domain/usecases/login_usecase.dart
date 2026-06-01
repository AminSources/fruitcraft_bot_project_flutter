import 'package:fruitcraft_bot_project/core/params/login_params.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/domain/entities/auth_entity.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/domain/repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository authRepository;

  LoginUsecase(this.authRepository);

  Future<AuthEntity> call(LoginParams loginParams) async {
    return await authRepository.login(loginParams);
  }
}
