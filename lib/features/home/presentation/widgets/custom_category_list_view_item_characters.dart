import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/home/data/models/historical_characters_model.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
          SizedBox(
            height: 96,
            width: 74,
            child: CachedNetworkImage(
              imageUrl: characterModel.image,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: AppColors.grey,
                highlightColor: Colors.white,
                child: Container(width: 47, height: 64, color: AppColors.grey),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          const SizedBox(height: 11),
          Text(characterModel.name, style: CustomTextStyles.poppins500style14),
        ],
      ),
    );
  }
}
