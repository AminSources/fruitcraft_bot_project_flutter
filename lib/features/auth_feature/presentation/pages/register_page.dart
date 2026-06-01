import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitcraft_bot_project/core/params/register_params.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/presentation/bloc/auth_bloc.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/presentation/widgets/auth_skeleton.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    //* initialize text fields controllers
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    //* initialize text fields focus nodes
    FocusNode nameFocusNode = FocusNode();
    FocusNode emailFocusNode = FocusNode();
    FocusNode passwordFocusNode = FocusNode();

    return GestureDetector(
      onTap: () {
        //* unfocus text fields when user taps outside of them
        nameFocusNode.unfocus();
        emailFocusNode.unfocus();
        passwordFocusNode.unfocus();
      },
      child: Scaffold(
        //* body
        body: AuthSkeleton(
          height: 200.h,
          labels: ["Name", "Email", "Password"],
          controllers: [nameController, emailController, passwordController],
          focusNodes: [nameFocusNode, emailFocusNode, passwordFocusNode],
          isLoginPage: false,
          buttonText: "Register",
          buttonOnPress: () {
            //? call login api
            context.read<AuthBloc>().add(
              RegisterRequestedEvent(
                registerParams: RegisterParams(
                  name: nameController.text,
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
            Navigator.pushNamed(context, "/login");
          },
        ),
      ),
    );
  }
}
