part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUserProfileEvent extends UserEvent {
  final String token;

  const LoadUserProfileEvent({required this.token});

  @override
  List<Object> get props => [token];
}

class ResetUserEvent extends UserEvent {}
