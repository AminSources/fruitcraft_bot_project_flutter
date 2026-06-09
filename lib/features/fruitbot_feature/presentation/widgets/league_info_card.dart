import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitcraft_bot_project/core/widgets/txt.dart';
import 'package:fruitcraft_bot_project/features/fruitbot_feature/domain/entities/fruit_player_entity.dart';
import 'package:fruitcraft_bot_project/features/fruitbot_feature/presentation/widgets/main_info_row.dart';

class LeagueInfoCard extends StatelessWidget {
  final FruitPlayerEntity playerInfo;

  const LeagueInfoCard({super.key, required this.playerInfo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.w,
      height: 150.h,
      child: Card(
        color: const Color.fromARGB(255, 135, 201, 255),
        child: Padding(
          padding: EdgeInsets.all(15.w),
          child: Column(
            children: [
              //* score
              MainInfoRow(
                value: playerInfo.weeklyScore.toString(),
                iconPath: "score@2x.png",
              ),

              //* league rank
              Container(
                width: double.infinity,
                height: 40.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/assets/images/League-6@2x.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 5.w, left: 15.w),
                  child: Center(
                    child: txt(
                      playerInfo.leagueRank.toString(),
                      color: Colors.white,
                      size: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              //* global rank
              Container(
                width: double.infinity,
                height: 40.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/assets/images/FC-home-rank@2x.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 5.w, left: 15.w),
                  child: Center(
                    child: txt(
                      playerInfo.rank.toString(),
                      color: Colors.white,
                      size: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
