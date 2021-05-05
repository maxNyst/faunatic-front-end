import 'package:json_annotation/json_annotation.dart';
part 'species_text_data.g.dart';

@JsonSerializable()
class SpeciesTextData {
  String characteristic;
  String conservationMeasures;
  String ecology;
  String spreadAndStatus;
  String threat;


  SpeciesTextData(this.characteristic, this.conservationMeasures, this.ecology,
      this.spreadAndStatus, this.threat);

  factory SpeciesTextData.fromJson(Map<String, dynamic> json) => _$SpeciesTextDataFromJson(json);
  Map<String, dynamic> toJson() => _$SpeciesTextDataToJson(this);

  @override
  String toString() {
    return 'SpeciesTextData{characteristic: $characteristic, conservationMeasures: $conservationMeasures, ecology: $ecology, spreadAndStatus: $spreadAndStatus, threat: $threat}';
  }
}