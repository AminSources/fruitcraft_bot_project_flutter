import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitcraft_bot_project/core/params/login_params.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/presentation/bloc/auth_bloc.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/presentation/widgets/auth_skeleton.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    //* initialize text fields controllers
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    //* initialize text fields focus nodes
    FocusNode emailFocusNode = FocusNode();
    FocusNode passwordFocusNode = FocusNode();

    return GestureDetector(
      onTap: () {
        //* unfocus text fields when user taps outside of them
        emailFocusNode.unfocus();
        passwordFocusNode.unfocus();
      },
      child: Scaffold(
        //* body
        body: AuthSkeleton(
          height: 150.h,
          labels: ["Email", "Password"],
          controllers: [emailController, passwordController],
          focusNodes: [emailFocusNode, passwordFocusNode],
          isLoginPage: true,
          buttonText: "Login",
          buttonOnPress: () {
            //? call login api
            context.read<AuthBloc>().add(
              LoginRequestedEvent(
                loginParams: LoginParams(
                  email: emailController.text,
                  password: passwordController.text,
                ),
              ),
            );
          },
          textButtonOnPress: () {
            //? reset state
            context.read<AuthBloc>().add(ResetAuthEvent());

            //? navigation to register page
            Navigator.pushNamed(context, "/register");
            //TODO the navigator must be change to pushReplacement , also for login page.
          },
        ),
      ),
    );
  }
}
