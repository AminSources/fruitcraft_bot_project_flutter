import 'package:fruitcraft_bot_project/features/auth_feature/data/data_source/remote/auth_api_provider.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/data/repositories/auth_repository_impl.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/domain/repositories/auth_repository.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/domain/usecases/login_usecase.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/domain/usecases/register_usecase.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //* register api providers
  AuthApiProvider authApiProvider = AuthApiProvider();

  //* register repositories
  locator.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(authApiProvider),
  );

  //* register usecases
  locator.registerSingleton<LoginUsecase>(LoginUsecase(locator()));
  locator.registerSingleton<RegisterUsecase>(RegisterUsecase(locator()));

  //* register bloc
  locator.registerSingleton<AuthBloc>(
    AuthBloc(loginUsecase: locator(), registerUsecase: locator()),
  );
}
