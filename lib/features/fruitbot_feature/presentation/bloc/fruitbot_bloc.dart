import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruitcraft_bot_project/core/params/fruitbot_params.dart';
import 'package:fruitcraft_bot_project/features/fruitbot_feature/domain/entities/fruit_player_entity.dart';
import 'package:fruitcraft_bot_project/features/fruitbot_feature/domain/usecases/load_player_info_usecase.dart';
import 'package:fruitcraft_bot_project/features/fruitbot_feature/presentation/bloc/fruitbot_status.dart';

part 'fruitbot_event.dart';
part 'fruitbot_state.dart';

class FruitbotBloc extends Bloc<FruitbotEvent, FruitbotState> {
  final LoadPlayerInfoUsecase loadPlayerInfoUsecase;

  FruitbotBloc({required this.loadPlayerInfoUsecase})
    : super(
        FruitbotState(
          status: FruitbotStatus(
            status: BotStatus.initial,
            action: BotAction.none,
          ),
        ),
      ) {
    //? handle load player info
    on<LoadPlayerInfoEvent>(_loadPlayerInfo);
  }

  void _loadPlayerInfo(
    LoadPlayerInfoEvent event,
    Emitter<FruitbotState> emit,
  ) async {
    //? set loading state
    emit(
      state.copyWith(
        status: FruitbotStatus(
          status: BotStatus.loading,
          action: BotAction.loadPlayerInfo,
        ),
      ),
    );

    try {
      //? fetch player info from usecase
      final playerInfo = await loadPlayerInfoUsecase(event.loadPlayerParams);

      //? emit success state
      emit(
        state.copyWith(
          status: FruitbotStatus(
            status: BotStatus.success,
            action: BotAction.loadPlayerInfo,
          ),
          playerInfo: playerInfo,
          errorMessage: null,
        ),
      );
    } catch (error) {
      //? emit failure state
      emit(
        state.copyWith(
          status: FruitbotStatus(
            status: BotStatus.failure,
            action: BotAction.loadPlayerInfo,
          ),
          playerInfo: null,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
