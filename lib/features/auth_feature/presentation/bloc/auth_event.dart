part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginRequestedEvent extends AuthEvent {
  final LoginParams loginParams;

  const LoginRequestedEvent({required this.loginParams});

  @override
  List<Object> get props => [loginParams];
}

class RegisterRequestedEvent extends AuthEvent {
  final RegisterParams registerParams;

  const RegisterRequestedEvent({required this.registerParams});

  @override
  List<Object> get props => [registerParams];
}

class ResetAuthEvent extends AuthEvent {
  const ResetAuthEvent();

  @override
  List<Object> get props => [];
}
