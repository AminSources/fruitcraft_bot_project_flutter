import 'package:flutter/material.dart';
import 'package:fruitcraft_bot_project/features/user_feature/domain/entities/user_entity.dart';

@immutable
abstract class UserStatus {}

class UserInitial extends UserStatus {}

class UserLoading extends UserStatus {}

class UserSuccess extends UserStatus {
  final UserEntity userEntity;

  UserSuccess(this.userEntity);
}

class UserFailure extends UserStatus {
  final String message;

  UserFailure(this.message);
}
