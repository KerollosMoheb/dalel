import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_header_text.dart';
import 'package:dalel/features/home/presentation/widgets/custom_category_list_view_books.dart';
import 'package:flutter/material.dart';

class HistoricalBooksSection extends StatelessWidget {
  const HistoricalBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(text: AppStrings.historyBooks),
        SizedBox(height: 16),
        CustomCategoryListViewBooks(),
      ],
    );
  }
}
