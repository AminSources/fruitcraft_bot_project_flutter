part of 'auth_bloc.dart';

class AuthState {
  final AuthStatus authStatus;

  AuthState({required this.authStatus});

  AuthState copyWith({AuthStatus? authStatus}) {
    return AuthState(authStatus: authStatus ?? this.authStatus);
  }
}
