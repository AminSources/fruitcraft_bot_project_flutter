import 'package:fruitcraft_bot_project/core/session/restore_key_manager.dart';
import 'package:fruitcraft_bot_project/core/session/session_manager.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/data/data_source/remote/auth_api_provider.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/data/repositories/auth_repository_impl.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/domain/repositories/auth_repository.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/domain/usecases/login_usecase.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/domain/usecases/register_usecase.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/presentation/bloc/auth_bloc.dart';
import 'package:fruitcraft_bot_project/features/fruitbot_feature/data/data_source/remote/fruitbot_api_provider.dart';
import 'package:fruitcraft_bot_project/features/fruitbot_feature/data/repositories/fruitbot_repository_impl.dart';
import 'package:fruitcraft_bot_project/features/fruitbot_feature/domain/repositories/fruitbot_repository.dart';
import 'package:fruitcraft_bot_project/features/fruitbot_feature/domain/usecases/load_player_info_usecase.dart';
import 'package:fruitcraft_bot_project/features/fruitbot_feature/presentation/bloc/fruitbot_bloc.dart';
import 'package:fruitcraft_bot_project/features/user_feature/data/data_source/remote/user_api_provider.dart';
import 'package:fruitcraft_bot_project/features/user_feature/data/repositories/user_repository_impl.dart';
import 'package:fruitcraft_bot_project/features/user_feature/domain/repositories/user_repository.dart';
import 'package:fruitcraft_bot_project/features/user_feature/domain/usecases/add_fruit_account_usecase.dart';
import 'package:fruitcraft_bot_project/features/user_feature/domain/usecases/user_usecase.dart';
import 'package:fruitcraft_bot_project/features/user_feature/presentation/bloc/fruit_account_bloc/fruit_account_bloc.dart';
import 'package:fruitcraft_bot_project/features/user_feature/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //* register api providers
  AuthApiProvider authApiProvider = AuthApiProvider();
  UserApiProvider userApiProvider = UserApiProvider();
  FruitbotApiProvider fruitbotApiProvider = FruitbotApiProvider();

  //* register repositories
  locator.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(authApiProvider),
  );
  locator.registerSingleton<UserRepository>(
    UserRepositoryImpl(userApiProvider),
  );
  locator.registerSingleton<FruitbotRepository>(
    FruitbotRepositoryImpl(fruitbotApiProvider),
  );

  //* register usecases
  locator.registerSingleton<LoginUsecase>(LoginUsecase(locator()));
  locator.registerSingleton<RegisterUsecase>(RegisterUsecase(locator()));
  locator.registerSingleton<UserUsecase>(UserUsecase(locator()));
  locator.registerSingleton<AddFruitAccountUsecase>(
    AddFruitAccountUsecase(locator()),
  );
  locator.registerSingleton<LoadPlayerInfoUsecase>(
    LoadPlayerInfoUsecase(locator()),
  );

  //* register bloc
  locator.registerSingleton<AuthBloc>(
    AuthBloc(loginUsecase: locator(), registerUsecase: locator()),
  );
  locator.registerSingleton<UserBloc>(UserBloc(userUsecase: locator()));
  locator.registerSingleton(
    FruitAccountBloc(addFruitAccountUsecase: locator()),
  );
  locator.registerSingleton<FruitbotBloc>(
    FruitbotBloc(loadPlayerInfoUsecase: locator()),
  );

  //* session manager
  locator.registerSingleton<SessionManager>(SessionManager());
  locator.registerSingleton<RestoreKeyManager>(RestoreKeyManager());
}
