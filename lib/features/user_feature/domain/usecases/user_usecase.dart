import 'package:fruitcraft_bot_project/features/user_feature/domain/entities/user_entity.dart';
import 'package:fruitcraft_bot_project/features/user_feature/domain/repositories/user_repository.dart';

class UserUsecase {
  UserRepository userRepository;

  UserUsecase(this.userRepository);

  Future<UserEntity> call(String token) async {
    return await userRepository.fetchProfile(token);
  }
}
