import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String token;
  final String message;

  const AuthEntity({required this.token, required this.message});

  @override
  List<Object?> get props => [token, message];
}
