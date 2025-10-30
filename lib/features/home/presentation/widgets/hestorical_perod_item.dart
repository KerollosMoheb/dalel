import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/home/data/models/historical_periods_model.dart';
import 'package:flutter/material.dart';

class HestoricalPeriodItem extends StatelessWidget {
  const HestoricalPeriodItem({super.key, required this.historicalModel});

  final HistoricalPeriodsModel historicalModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164,
      height: 96,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey,
            blurRadius: 5,
            offset: Offset(0, 2.5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 48,
              width: 63,
              child: Text(
                historicalModel.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: CustomTextStyles.poppins500style16,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: 64,
              width: 47,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(historicalModel.image),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
