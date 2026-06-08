import 'package:fruitcraft_bot_project/core/params/fruit_account_params.dart';
import 'package:fruitcraft_bot_project/features/user_feature/domain/repositories/user_repository.dart';

class AddFruitAccountUsecase {
  final UserRepository userRepository;

  AddFruitAccountUsecase(this.userRepository);

  Future<String> call(FruitAccountParams fruitAccountParams) async {
    return await userRepository.addFruitAccount(fruitAccountParams);
  }
}
