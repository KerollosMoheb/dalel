import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/home/data/models/historical_souvenirs_model.dart';
import 'package:flutter/material.dart';

class CustomCategoryListViewItemBooks extends StatelessWidget {
  const CustomCategoryListViewItemBooks({super.key, required this.booksModel});
  final HistoricalBooksModel booksModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 200,
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
            width: 85,
            height: 85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: NetworkImage(booksModel.image),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            booksModel.name,
            textAlign: TextAlign.center,
            style: CustomTextStyles.poppins500style14,
          ),
        ],
      ),
    );
  }
}
