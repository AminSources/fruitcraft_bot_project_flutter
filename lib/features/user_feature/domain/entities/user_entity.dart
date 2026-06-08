import 'package:equatable/equatable.dart';

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

class FruitAccountEntity extends Equatable {
  final String name;
  final String restoreKey;
  final String licenseKey;

  const FruitAccountEntity({
    required this.name,
    required this.restoreKey,
    required this.licenseKey,
  });

  @override
  List<Object?> get props => [name, restoreKey, licenseKey];
}
