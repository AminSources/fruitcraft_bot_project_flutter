import 'package:flutter/material.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/domain/entities/auth_entity.dart';

@immutable
abstract class AuthStatus {}

class AuthInitial extends AuthStatus {}

class AuthLoading extends AuthStatus {}

class AuthSuccess extends AuthStatus {
  final AuthEntity user;

  AuthSuccess(this.user);
}

class AuthFailure extends AuthStatus {
  final String message;

  AuthFailure(this.message);
}
