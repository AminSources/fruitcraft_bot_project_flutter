import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitcraft_bot_project/core/widgets/txt.dart';
import 'package:fruitcraft_bot_project/features/user_feature/domain/entities/fruit_account_entity.dart';

class FruitAccountCard extends StatelessWidget {
  final FruitAccountEntity account;

  const FruitAccountCard({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              txt("Account name: ${account.name}"),
              txt("Restore key: ${account.restoreKey}"),
              txt("License key: ${account.licenseKey}"),
              Row(
                children: [
                  txt("Account Status: "),
                  txt("Unknown", color: Colors.blue),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
