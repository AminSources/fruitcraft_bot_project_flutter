import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitcraft_bot_project/core/widgets/txt.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/presentation/bloc/auth_bloc.dart';
import 'package:fruitcraft_bot_project/features/auth_feature/presentation/bloc/auth_status.dart';

class AuthSkeleton extends StatelessWidget {
  final List<String> labels;
  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final String buttonText;
  final Function()? buttonOnPress;
  final bool isLoginPage;
  final Function()? textButtonOnPress;
  final double? height;

  const AuthSkeleton({
    super.key,
    required this.labels,
    required this.controllers,
    required this.focusNodes,
    required this.buttonText,
    this.buttonOnPress,
    required this.isLoginPage,
    this.textButtonOnPress,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.sizeOf(context).height - 50.h,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //* title image
                  Image.asset(
                    "lib/assets/images/auth_title_image.png",
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height: 30.h),

                  //* error txt
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state.authStatus is AuthFailure) {
                        return txt(
                          (state.authStatus as AuthFailure).message,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                  SizedBox(height: 10.h),

                  //* fields
                  SizedBox(
                    width: double.infinity,
                    height: height ?? 150.h,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: labels.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            TextField(
                              controller: controllers[index],
                              focusNode: focusNodes[index],
                              decoration: InputDecoration(
                                labelText: labels[index],
                              ),
                            ),
                            SizedBox(height: 10.h),
                          ],
                        );
                      },
                    ),
                  ),

                  //* login button
                  BlocConsumer<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state.authStatus is AuthLoading) {
                        return const CircularProgressIndicator();
                      } else {
                        return SizedBox(
                          width: double.infinity,
                          height: 50.h,
                          child: ElevatedButton(
                            onPressed: buttonOnPress,
                            child: txt(buttonText),
                          ),
                        );
                      }
                    },
                    listener: (context, state) {
                      if (state.authStatus is AuthSuccess) {
                        //? push to bot page
                        Navigator.pushReplacementNamed(context, '/bot');
                      }
                    },
                  ),
                  SizedBox(height: 30.h),

                  //* don't have an account? register button
                  TextButton(
                    onPressed: textButtonOnPress,
                    child: txt(
                      isLoginPage == true
                          ? "Don't have an account? Register"
                          : "Do you have an account? Login",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
