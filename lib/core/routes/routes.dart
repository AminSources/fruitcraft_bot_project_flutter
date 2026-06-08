import 'package:flutter/material.dart';
import 'package:fruitcraft_bot_project/features/user_feature/presentation/pages/home_page.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/presentation/pages/login_page.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/presentation/pages/register_page.dart';
import 'package:fruitcraft_bot_project/features/fruitbot_feature/presentation/pages/bot_page.dart';

class Routes {
  Map<String, WidgetBuilder> get routes => {
    "/login": (context) => LoginPage(),
    "/register": (context) => RegisterPage(),
    "/home": (context) => HomePage(),
    "/bot": (context) => BotPage(),
  };
}
