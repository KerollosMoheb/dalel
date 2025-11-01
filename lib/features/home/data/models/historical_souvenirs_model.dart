import 'package:dalel/core/utils/app_strings.dart';

class HistoricalBooksModel {
  final String name;
  final String image;

  HistoricalBooksModel({required this.name, required this.image});

  factory HistoricalBooksModel.fromJson(jsonData) {
    return HistoricalBooksModel(
      name: jsonData[FireBaseStrings.name],
      image: jsonData[FireBaseStrings.image],
    );
  }
}
