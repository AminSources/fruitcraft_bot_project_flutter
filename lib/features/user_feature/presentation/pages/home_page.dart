import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitcraft_bot_project/core/session/session_manager.dart';
import 'package:fruitcraft_bot_project/core/widgets/txt.dart';
import 'package:fruitcraft_bot_project/features/user_feature/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:fruitcraft_bot_project/features/user_feature/presentation/bloc/user_bloc/user_status.dart';
import 'package:fruitcraft_bot_project/features/user_feature/presentation/widgets/add_account_bottom_sheet.dart';
import 'package:fruitcraft_bot_project/locator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //* token
  late final String token;

  @override
  void initState() {
    //* get token
    token = locator<SessionManager>().token!;

    //? load user profile
    context.read<UserBloc>().add(LoadUserProfileEvent(token: token));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //? open add account bottom sheet
          showModalBottomSheet(
            context: context,
            builder: (context) => AddAccountBottomSheet(token: token),
          );
        },
        child: const Icon(Icons.add),
      ),

      //* body of page
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: SizedBox.expand(
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state.userStatus is UserInitial) {
                return SizedBox.shrink();
              }
              if (state.userStatus is UserLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state.userStatus is UserFailure) {
                //* cast user status to user failure
                final userFailure = state.userStatus as UserFailure;

                return Center(child: txt(userFailure.message));
              }
              if (state.userStatus is UserSuccess) {
                //* cast user state to user success
                final userSuccess = state.userStatus as UserSuccess;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* hello user
                    txt(
                      "Hello, ${userSuccess.userEntity.name}!",
                      size: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),

                    //* user accounts
                    userSuccess.userEntity.fruitAccounts.isEmpty
                        ? Expanded(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //* image
                                  Image.asset(
                                    "lib/assets/images/sarhang.png",
                                    width: 100.w,
                                    height: 100.h,
                                  ),
                                  SizedBox(height: 15.h),

                                  //* txt
                                  txt(
                                    "You don't have any accounts yet\ntap ' + ' button to add one",
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount:
                                userSuccess.userEntity.fruitAccounts.length,
                            itemBuilder: (context, index) {
                              final account =
                                  userSuccess.userEntity.fruitAccounts[index];
                              return Card(
                                child: Column(
                                  children: [
                                    txt("name: ${account.name}"),
                                    txt("restore key: ${account.restoreKey}"),
                                    txt("license key: ${account.licenseKey}"),
                                  ],
                                ),
                              );
                            },
                          ),
                  ],
                );
              }
              return SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
