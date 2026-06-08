import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitcraft_bot_project/core/params/fruit_account_params.dart';
import 'package:fruitcraft_bot_project/core/widgets/txt.dart';
import 'package:fruitcraft_bot_project/features/user_feature/presentation/bloc/fruit_account_bloc/fruit_account_bloc.dart';
import 'package:fruitcraft_bot_project/features/user_feature/presentation/bloc/fruit_account_bloc/fruit_account_status.dart';
import 'package:fruitcraft_bot_project/features/user_feature/presentation/bloc/user_bloc/user_bloc.dart';

class AddAccountBottomSheet extends StatefulWidget {
  final String token;

  const AddAccountBottomSheet({super.key, required this.token});

  @override
  State<AddAccountBottomSheet> createState() => _AddAccountBottomSheetState();
}

class _AddAccountBottomSheetState extends State<AddAccountBottomSheet> {
  final accountNameController = TextEditingController();
  final restoreKeyController = TextEditingController();
  final licenseKeyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //* title
          txt("Add Account", size: 18.sp, fontWeight: FontWeight.bold),
          SizedBox(height: 10.h),

          //* account name
          TextField(
            controller: accountNameController,
            decoration: const InputDecoration(labelText: "Account Name"),
          ),
          SizedBox(height: 10.h),

          //* restore key text field
          TextField(
            controller: restoreKeyController,
            decoration: const InputDecoration(labelText: "restore key"),
          ),
          SizedBox(height: 10.h),

          //* license key text field
          TextField(
            controller: licenseKeyController,
            decoration: const InputDecoration(labelText: "license key"),
          ),
          SizedBox(height: 15.h),

          //* i don't have a license key text
          TextButton(
            onPressed: () {},
            child: txt("I don't have a license key"),
          ),
          SizedBox(height: 5.h),

          //* error text
          BlocBuilder<FruitAccountBloc, FruitAccountState>(
            builder: (context, state) {
              if (state.fruitAccountStatus is FruitAccountFailure) {
                return Chip(
                  color: WidgetStatePropertyAll(Colors.red),
                  side: BorderSide.none,
                  label: txt(
                    (state.fruitAccountStatus as FruitAccountFailure).message,
                    color: Colors.white,
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          SizedBox(height: 5.h),

          //* add button
          BlocConsumer<FruitAccountBloc, FruitAccountState>(
            builder: (context, state) {
              if (state.fruitAccountStatus is FruitAccountLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () {
                      //* create fruit account params
                      final fruitAccountParams = FruitAccountParams(
                        token: widget.token,
                        name: accountNameController.text,
                        restoreKey: restoreKeyController.text,
                        licenseKey: licenseKeyController.text,
                      );

                      //? call add account usecase
                      context.read<FruitAccountBloc>().add(
                        AddFruitAccountEvent(
                          fruitAccountParams: fruitAccountParams,
                        ),
                      );
                    },
                    child: const Text("Add"),
                  ),
                );
              }
            },
            listener: (context, state) {
              if (state.fruitAccountStatus is FruitAccountSuccess) {
                //? call profile usecase
                context.read<UserBloc>().add(
                  LoadUserProfileEvent(token: widget.token),
                );

                //? close bottom sheet
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
