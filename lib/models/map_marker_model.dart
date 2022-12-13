class MapMarkerModel {
  late String id;
  late String title;
  late String markerId;
  late String latitude;
  late String longitude;

  MapMarkerModel(
      {required this.id,
        required this.title,
        required this.markerId,
        required this.latitude,
        required this.longitude});

  factory MapMarkerModel.fromJson(Map<String, dynamic> json) {
    return MapMarkerModel(
        id: json["id"].toString(),
        title: json["title"],
        markerId: json["marker_id"],
        latitude: json["latitude"],
        longitude: json["longitude"]);
  }
}
