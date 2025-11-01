import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_shimmer.dart';
import 'package:dalel/features/home/data/models/historical_characters_model.dart';
import 'package:dalel/features/home/presentation/widgets/custom_category_list_view_item_characters.dart';
import 'package:flutter/material.dart';

class CustomCategoryListViewCharachters extends StatelessWidget {
  const CustomCategoryListViewCharachters({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance
          .collection(FireBaseStrings.historicalCharacters)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.docs[0].exists) {
          return Text("Document does not exist");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          List<HistoricalCharactersModel> historicalCharacters = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            historicalCharacters.add(
              HistoricalCharactersModel.fromJson(snapshot.data!.docs[i]),
            );
          }
          return SizedBox(
            height: 133,
            child: ListView.separated(
              clipBehavior: Clip.none,
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(width: 16),
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return CustomCategoryListViewItemCharachters(
                  characterModel: historicalCharacters[index],
                );
              },
            ),
          );
        }
        return CustomShimmer(width: 74, height: 133);
      },
    );
  }
}
