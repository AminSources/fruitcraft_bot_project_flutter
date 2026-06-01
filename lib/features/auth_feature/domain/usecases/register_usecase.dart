import 'package:fruitcraft_bot_project/core/params/register_params.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/domain/entities/auth_entity.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/domain/repositories/auth_repository.dart';

class RegisterUsecase {
  AuthRepository authRepository;

  RegisterUsecase(this.authRepository);

  Future<AuthEntity> call(RegisterParams registerParams) async {
    return await authRepository.register(registerParams);
  }
}
