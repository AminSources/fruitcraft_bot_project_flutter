import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitcraft_bot_project/core/widgets/txt.dart';

class MainInfoRow extends StatelessWidget {
  final String value;
  final String iconPath;

  const MainInfoRow({super.key, required this.value, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //* image
        Image.asset("lib/assets/images/$iconPath", width: 30.w, height: 30.h),
        SizedBox(width: 10.w),

        txt(
          value,
          color: Colors.white,
          size: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
