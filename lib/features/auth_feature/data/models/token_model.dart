import 'package:fruitcraft_bot_project/features/auth_feature/domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({required super.token, required super.message});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(token: json['token'], message: json['message']);
  }
}
