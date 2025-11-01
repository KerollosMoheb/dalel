import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/home/data/models/historical_souvenirs_model.dart';
import 'package:dalel/features/home/presentation/widgets/custom_category_list_view_item_books.dart';
import 'package:flutter/material.dart';

class CustomCategoryListViewBooks extends StatelessWidget {
  const CustomCategoryListViewBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance
          .collection(FireBaseStrings.historicalBooks)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.docs[0].exists) {
          return Text("Document does not exist");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          List<HistoricalBooksModel> historicalBooks = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            historicalBooks.add(
              HistoricalBooksModel.fromJson(snapshot.data!.docs[i]),
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
                return CustomCategoryListViewItemBooks(
                  booksModel: historicalBooks[index],
                );
              },
            ),
          );
        }
        return Text("loading");
      },
    );
  }
}
