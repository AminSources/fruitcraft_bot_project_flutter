import 'package:fruitcraft_bot_project/features/auth_feature/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({required super.email, required super.password});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(email: json['email'], password: json['password']);
  }
}
