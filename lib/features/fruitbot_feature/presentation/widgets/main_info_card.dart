import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitcraft_bot_project/core/widgets/txt.dart';
import 'package:fruitcraft_bot_project/features/fruitbot_feature/domain/entities/fruit_player_entity.dart';
import 'package:fruitcraft_bot_project/features/fruitbot_feature/presentation/widgets/main_info_column.dart';

class MainInfoCard extends StatelessWidget {
  final FruitPlayerEntity playerInfo;

  const MainInfoCard({super.key, required this.playerInfo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150.h,
      child: Card(
        color: const Color.fromARGB(255, 140, 216, 142),
        child: Padding(
          padding: EdgeInsets.all(15.w),
          child: Row(
            children: [
              //* player level
              Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "lib/assets/images/FC-TU-listellipse@2x.png",
                    ),
                    //fit: BoxFit.fill,
                  ),
                ),
                child: Center(
                  child: txt(
                    "LvL: ${playerInfo.level}",
                    color: Colors.white,
                    size: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              //* gold and exir
              Expanded(
                child: MainInfoColumn(
                  values: [
                    playerInfo.gold.toString(),
                    playerInfo.nectar.toString(),
                  ],
                  iconPaths: [
                    "FC-navbar-gold@2x.png",
                    "FC-navbar-nectar@2x.png",
                  ],
                ),
              ),

              //* potion and xp
              Expanded(
                child: MainInfoColumn(
                  values: [
                    playerInfo.potionNum.toString(),
                    playerInfo.xp.toString(),
                  ],
                  iconPaths: ["potionLogo@2x.png", "FC-Outcome-XP@2x.png"],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
