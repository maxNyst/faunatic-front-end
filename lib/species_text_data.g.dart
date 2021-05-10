// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'species_text_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpeciesTextData _$SpeciesTextDataFromJson(Map<String, dynamic> json) {
  return SpeciesTextData(
    json['characteristic'] as String?,
    json['conservationMeasures'] as String?,
    json['ecology'] as String?,
    json['spreadAndStatus'] as String?,
    json['threat'] as String?,
  );
}

Map<String, dynamic> _$SpeciesTextDataToJson(SpeciesTextData instance) =>
    <String, dynamic>{
      'characteristic': instance.characteristic,
      'conservationMeasures': instance.conservationMeasures,
      'ecology': instance.ecology,
      'spreadAndStatus': instance.spreadAndStatus,
      'threat': instance.threat,
    };
