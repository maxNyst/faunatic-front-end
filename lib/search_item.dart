
class SearchItem {
  final int taxonId;
  final String swedishName;
  final String scientificName;

  SearchItem(
      {required this.taxonId,
      required this.swedishName,
      required this.scientificName});

  factory SearchItem.fromJson(Map<String, dynamic> json) {
    return SearchItem(
      taxonId: json['taxonId'],
      swedishName: json['swedishName'],
      scientificName: json['scientificName'],
    );
  }

  @override
  String toString() {
    return '$swedishName - på latin: $scientificName';
  }
}
