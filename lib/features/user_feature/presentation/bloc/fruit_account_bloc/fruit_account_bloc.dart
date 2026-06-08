import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruitcraft_bot_project/core/params/fruit_account_params.dart';
import 'package:fruitcraft_bot_project/features/user_feature/domain/usecases/add_fruit_account_usecase.dart';
import 'package:fruitcraft_bot_project/features/user_feature/presentation/bloc/fruit_account_bloc/fruit_account_status.dart';

part 'fruit_account_event.dart';
part 'fruit_account_state.dart';

class FruitAccountBloc extends Bloc<FruitAccountEvent, FruitAccountState> {
  final AddFruitAccountUsecase addFruitAccountUsecase;

  FruitAccountBloc({required this.addFruitAccountUsecase})
    : super(FruitAccountState(fruitAccountStatus: FruitAccountInitial())) {
    //? handle add fruit account event
    on<AddFruitAccountEvent>(_onAddFruitAccountEvent);
  }

  void _onAddFruitAccountEvent(
    AddFruitAccountEvent event,
    Emitter<FruitAccountState> emit,
  ) async {
    //? set loading state
    emit(state.copyWith(fruitAccountStatus: FruitAccountLoading()));

    try {
      //? fetch user profile from usecase
      await addFruitAccountUsecase(event.fruitAccountParams);

      //? emit success state
      emit(state.copyWith(fruitAccountStatus: FruitAccountSuccess()));
    } catch (error) {
      emit(
        state.copyWith(
          fruitAccountStatus: FruitAccountFailure(error.toString()),
        ),
      );
    }
  }
}
