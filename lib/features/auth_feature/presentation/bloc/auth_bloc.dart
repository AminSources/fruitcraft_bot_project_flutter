import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruitcraft_bot_project/core/params/login_params.dart';
import 'package:fruitcraft_bot_project/core/params/register_params.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/domain/usecases/login_usecase.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/domain/usecases/register_usecase.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/presentation/bloc/auth_status.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;
  final RegisterUsecase registerUsecase;

  AuthBloc({required this.loginUsecase, required this.registerUsecase})
    : super(AuthState(authStatus: AuthInitial())) {
    //? handle login event
    on<LoginRequestedEvent>(_login);

    //? handle register event
    on<RegisterRequestedEvent>(_register);

    //? handle reset event
    on<ResetAuthEvent>(_reset);
  }

  void _login(LoginRequestedEvent event, Emitter<AuthState> emit) async {
    //? set loading state
    emit(state.copyWith(authStatus: AuthLoading()));

    try {
      //? fetch login from usecase
      final user = await loginUsecase(event.loginParams);

      //? emit success state
      emit(state.copyWith(authStatus: AuthSuccess(user)));
    } catch (error) {
      //? emit failure state
      emit(state.copyWith(authStatus: AuthFailure(error.toString())));
    }
  }

  void _register(RegisterRequestedEvent event, Emitter<AuthState> emit) async {
    //? set loading state
    emit(state.copyWith(authStatus: AuthLoading()));

    try {
      //? fetch register from usecase
      final user = await registerUsecase(event.registerParams);

      //? emit success state
      emit(state.copyWith(authStatus: AuthSuccess(user)));
    } catch (error) {
      //? emit failure state
      emit(state.copyWith(authStatus: AuthFailure(error.toString())));
    }
  }

  void _reset(ResetAuthEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(authStatus: AuthInitial()));
  }
}
