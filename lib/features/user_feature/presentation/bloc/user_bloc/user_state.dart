part of 'user_bloc.dart';

class UserState {
  final UserStatus userStatus;

  UserState({required this.userStatus});

  UserState copyWith({UserStatus? userStatus}) {
    return UserState(userStatus: userStatus ?? this.userStatus);
  }
}
