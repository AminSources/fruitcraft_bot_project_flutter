import 'package:flutter/material.dart';
import 'package:fruitcraft_bot_project/features/fruitbot_feature/presentation/widgets/main_info_row.dart';

class MainInfoColumn extends StatelessWidget {
  final List<String> values;
  final List<String> iconPaths;

  const MainInfoColumn({
    super.key,
    required this.values,
    required this.iconPaths,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        2,
        (index) =>
            MainInfoRow(value: values[index], iconPath: iconPaths[index]),
      ),
    );
  }
}
