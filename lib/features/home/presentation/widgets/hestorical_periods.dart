import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/home/data/models/historical_periods_model.dart';
import 'package:dalel/features/home/presentation/widgets/hestorical_perod_item.dart';
import 'package:flutter/material.dart';

class HestoricalPeriods extends StatelessWidget {
  const HestoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance
          .collection(FireBaseStrings.historicalPeriods)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.docs[0].exists) {
          return Text("Document does not exist");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          List<HistoricalPeriodsModel> historicalPeriods = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            historicalPeriods.add(
              HistoricalPeriodsModel.fromJson(snapshot.data!.docs[i]),
            );
          }
          return SizedBox(
            height: 96,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 10),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return HestoricalPeriodItem(
                  historicalModel: historicalPeriods[index],
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
