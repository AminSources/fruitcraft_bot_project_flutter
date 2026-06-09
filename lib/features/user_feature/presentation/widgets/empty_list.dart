import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitcraft_bot_project/core/widgets/txt.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
