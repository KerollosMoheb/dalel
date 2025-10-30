import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/features/home/presentation/widgets/hestorical_perod_item.dart';
import 'package:flutter/material.dart';

class HestoricalPeriods extends StatelessWidget {
  const HestoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HestoricalPeriodItem(
          text: 'Ancient Egypt',
          imagePath: Assets.imagesFrame1,
        ),
        HestoricalPeriodItem(
          text: "Islamic Era ",
          imagePath: Assets.imagesFrame2,
        ),
      ],
    );
  }
}
