import 'package:dalel/core/utils/app_strings.dart';

class HistoricalCharactersModel {
  final String name;
  final String image;
  final String description;
  final Map<String, dynamic> wars;

  HistoricalCharactersModel({
    required this.name,
    required this.image,
    required this.description,
    required this.wars,
  });

  factory HistoricalCharactersModel.fromJson(jsonData) {
    return HistoricalCharactersModel(
      name: jsonData[FireBaseStrings.name],
      image: jsonData[FireBaseStrings.image],
      description: jsonData[FireBaseStrings.description],
      wars: jsonData[FireBaseStrings.wars],
    );
  }
}
