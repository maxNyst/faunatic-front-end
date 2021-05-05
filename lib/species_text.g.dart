// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'species_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpeciesText _$SpeciesTextFromJson(Map<String, dynamic> json) {
  return SpeciesText(
    json['taxonId'] as int?,
    json['swedishName'] as String,
    json['scientificName'] as String,
    SpeciesTextData.fromJson(json['speciesData'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SpeciesTextToJson(SpeciesText instance) =>
    <String, dynamic>{
      'taxonId': instance.taxonId,
      'swedishName': instance.swedishName,
      'scientificName': instance.scientificName,
      'speciesData': instance.speciesData.toJson(),
    };
