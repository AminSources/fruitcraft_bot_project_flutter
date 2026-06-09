import 'package:fruitcraft_bot_project/features/user_feature/domain/entities/fruit_account_entity.dart';
import 'package:fruitcraft_bot_project/features/user_feature/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.email,
    required super.password,
    required super.name,
    required super.fruitAccounts,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      password: json['password'],
      name: json["name"],
      fruitAccounts: (json["fruit_accounts"] as List)
          .map((e) => FruitAccountModel.fromJson(e))
          .toList(),
    );
  }
}

class FruitAccountModel extends FruitAccountEntity {
  const FruitAccountModel({
    required super.name,
    required super.restoreKey,
    required super.licenseKey,
  });

  factory FruitAccountModel.fromJson(Map<String, dynamic> json) {
    return FruitAccountModel(
      name: json['name'],
      restoreKey: json['restore_key'],
      licenseKey: json['license_key'],
    );
  }
}
