import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitcraft_bot_project/core/routes/routes.dart';
import 'package:fruitcraft_bot_project/core/themes/app_theme.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/presentation/bloc/auth_bloc.dart';
import 'package:fruitcraft_bot_project/features/user_feature/presentation/bloc/fruit_account_bloc/fruit_account_bloc.dart';
import 'package:fruitcraft_bot_project/features/user_feature/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:fruitcraft_bot_project/locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();

  runApp(
    MultiBlocProvider(
      providers: [
        //* initialize auth bloc
        BlocProvider<AuthBloc>(create: (context) => locator<AuthBloc>()),

        //* initialize user bloc
        BlocProvider<UserBloc>(create: (context) => locator<UserBloc>()),

        //* initialize fruit account bloc
        BlocProvider<FruitAccountBloc>(create: (context) => locator()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          //* Initialize routes
          Routes routes = Routes();

          //* initialize app theme
          AppTheme appTheme = AppTheme();

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Fruit Craft Bot',
            theme: appTheme.lightTheme,
            routes: routes.routes,
            initialRoute: "/login",
          );
        },
      ),
    );
  }
}
