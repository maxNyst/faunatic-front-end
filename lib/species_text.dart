
import 'package:json_annotation/json_annotation.dart';
import 'species_text_data.dart';

part 'species_text.g.dart';

@JsonSerializable(explicitToJson: true)
class SpeciesText {

  int? taxonId;
  String swedishName;
  String scientificName;
  SpeciesTextData speciesData;

  SpeciesText(
  this.taxonId, this.swedishName, this.scientificName, this.speciesData);

  factory SpeciesText.fromJson(Map<String, dynamic> json) => _$SpeciesTextFromJson(json);
  Map<String, dynamic> toJson() => _$SpeciesTextToJson(this);

  @override
  String toString() {
    return 'SpeciesText{taxonId: $taxonId, swedishName: $swedishName, scientificName: $scientificName, speciesData: $speciesData}';
  }
}
