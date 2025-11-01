import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/home/data/models/historical_characters_model.dart';
import 'package:flutter/material.dart';

class CustomCategoryListViewItemCharachters extends StatelessWidget {
  const CustomCategoryListViewItemCharachters({
    super.key,
    required this.characterModel,
  });
  final HistoricalCharactersModel characterModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey,
            blurRadius: 5,
            offset: const Offset(0, 2.5),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 74,
            height: 96,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: NetworkImage(characterModel.image),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 11),
          Text(characterModel.name, style: CustomTextStyles.poppins500style14),
        ],
      ),
    );
  }
}
