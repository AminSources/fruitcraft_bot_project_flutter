import 'package:fruitcraft_bot_project/core/params/fruit_account_params.dart';
import 'package:fruitcraft_bot_project/features/user_feature/domain/entities/user_entity.dart';

abstract class UserRepository {
  //? fetch profile
  Future<UserEntity> fetchProfile(String token);

  //? fetch add fruit account
  Future<String> addFruitAccount(FruitAccountParams fruitAccountParams);
}
