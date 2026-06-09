import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitcraft_bot_project/core/params/fruitbot_params.dart';
import 'package:fruitcraft_bot_project/core/session/restore_key_manager.dart';
import 'package:fruitcraft_bot_project/core/session/session_manager.dart';
import 'package:fruitcraft_bot_project/core/widgets/txt.dart';
import 'package:fruitcraft_bot_project/features/fruitbot_feature/presentation/bloc/fruitbot_bloc.dart';
import 'package:fruitcraft_bot_project/features/fruitbot_feature/presentation/bloc/fruitbot_status.dart';
import 'package:fruitcraft_bot_project/features/fruitbot_feature/presentation/widgets/league_info_card.dart';
import 'package:fruitcraft_bot_project/features/fruitbot_feature/presentation/widgets/main_info_card.dart';
import 'package:fruitcraft_bot_project/locator.dart';

class BotPage extends StatefulWidget {
  const BotPage({super.key});

  @override
  State<BotPage> createState() => _BotPageState();
}

class _BotPageState extends State<BotPage> {
  @override
  void initState() {
    //* get token
    final token = locator<SessionManager>().token!;

    //* get restore key
    final restoreKey = locator<RestoreKeyManager>().restoreKey!;

    //* load player info params
    final loadPlayerParams = LoadPlayerParams(
      token: token,
      restoreKey: restoreKey,
    );

    //? load player info
    context.read<FruitbotBloc>().add(
      LoadPlayerInfoEvent(loadPlayerParams: loadPlayerParams),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FruitbotBloc, FruitbotState>(
        builder: (context, state) {
          if (state.status.status == BotStatus.initial) {
            return txt('idle');
          }

          if (state.status.status == BotStatus.loading) {
            return const CircularProgressIndicator();
          }

          if (state.status.status == BotStatus.failure) {
            return txt(state.errorMessage ?? 'error');
          }

          if (state.status.status == BotStatus.success) {
            return Padding(
              padding: EdgeInsets.all(15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //* player name
                  txt(
                    "Player name: ${state.playerInfo!.name}",
                    size: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),

                  //* player main info
                  MainInfoCard(playerInfo: state.playerInfo!),

                  //* row
                  Row(
                    children: [
                      //* league info
                      LeagueInfoCard(playerInfo: state.playerInfo!),

                      //* bank info
                    ],
                  ),
                ],
              ),
            );
          }
          return txt('idle');
        },
      ),
    );
  }
}
