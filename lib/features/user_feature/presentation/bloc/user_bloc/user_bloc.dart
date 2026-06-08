import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruitcraft_bot_project/features/user_feature/domain/usecases/user_usecase.dart';
import 'package:fruitcraft_bot_project/features/user_feature/presentation/bloc/user_bloc/user_status.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUsecase userUsecase;

  UserBloc({required this.userUsecase})
    : super(UserState(userStatus: UserInitial())) {
    //? handle load user profile event
    on<LoadUserProfileEvent>(_onLoadUserProfileEvent);

    //? handle reset event
    on<ResetUserEvent>(_reset);
  }

  void _onLoadUserProfileEvent(
    LoadUserProfileEvent event,
    Emitter<UserState> emit,
  ) async {
    //? set loading state
    emit(state.copyWith(userStatus: UserLoading()));

    try {
      //? fetch user profile from usecase
      final user = await userUsecase(event.token);

      //? emit success state
      emit(state.copyWith(userStatus: UserSuccess(user)));
    } catch (error) {
      emit(state.copyWith(userStatus: UserFailure(error.toString())));
    }
  }

  void _reset(ResetUserEvent event, Emitter<UserState> emit) {
    emit(state.copyWith(userStatus: UserInitial()));
  }
}
