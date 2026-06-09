import 'package:equatable/equatable.dart';
import 'package:fruitcraft_bot_project/features/user_feature/domain/entities/fruit_account_entity.dart';

class UserEntity extends Equatable {
  final String name;
  final String email;
  final String password;
  final List<FruitAccountEntity> fruitAccounts;

  const UserEntity({
    required this.name,
    required this.email,
    required this.password,
    required this.fruitAccounts,
  });

  @override
  List<Object?> get props => [name, email, password, fruitAccounts];
}
