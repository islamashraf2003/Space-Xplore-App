import 'package:json_annotation/json_annotation.dart';
part 'launch_response.g.dart';

@JsonSerializable()
class LaunchResponse {
  final LinksData links;
  final bool? success;
  final List<FailuresData> failures;
  final String? details;
  @JsonKey(name: "flight_number")
  final int? flightNumber;
  final String name;
  @JsonKey(name: "date_utc")
  final String date;
  final String id;

  LaunchResponse({
    required this.links,
    required this.success,
    required this.failures,
    required this.details,
    required this.flightNumber,
    required this.name,
    required this.date,
    required this.id,
  });

  factory LaunchResponse.fromJson(Map<String, dynamic> json) =>
      _$LaunchResponseFromJson(json);
}

@JsonSerializable()
class LinksData {
  final PatchData patch;
  final String? webcast;
  @JsonKey(name: "youtube_id")
  final String? youtubeId;
  final String? article;
  final String? wikipedia;

  LinksData({
    required this.patch,
    required this.webcast,
    required this.youtubeId,
    required this.article,
    required this.wikipedia,
  });

  factory LinksData.fromJson(Map<String, dynamic> json) =>
      _$LinksDataFromJson(json);
}

@JsonSerializable()
class PatchData {
  final String? small;
  final String? large;

  PatchData({required this.small, required this.large});

  factory PatchData.fromJson(Map<String, dynamic> json) =>
      _$PatchDataFromJson(json);
}

@JsonSerializable()
class FailuresData {
  final int? time;
  final int? altitude;
  final String? reason;

  FailuresData({
    required this.time,
    required this.altitude,
    required this.reason,
  });

  factory FailuresData.fromJson(Map<String, dynamic> json) =>
      _$FailuresDataFromJson(json);
}
