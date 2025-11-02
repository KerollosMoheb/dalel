
import 'package:dalel/core/models/data_model.dart';
import 'package:dalel/core/widgets/custom_data_list_view_item.dart';
import 'package:flutter/material.dart';

class CustomDataListView extends StatelessWidget {
  const CustomDataListView({super.key, required this.dataList});
  final List<DataModel> dataList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return CustomDataListViewItem(historicalModel: dataList[index]);
        },
      ),
    );
  }
}
