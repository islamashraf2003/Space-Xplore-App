// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaunchResponse _$LaunchResponseFromJson(Map<String, dynamic> json) =>
    LaunchResponse(
      links: LinksData.fromJson(json['links'] as Map<String, dynamic>),
      success: json['success'] as bool?,
      failures: (json['failures'] as List<dynamic>)
          .map((e) => FailuresData.fromJson(e as Map<String, dynamic>))
          .toList(),
      details: json['details'] as String?,
      flightNumber: (json['flight_number'] as num?)?.toInt(),
      name: json['name'] as String,
      date: json['date_utc'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$LaunchResponseToJson(LaunchResponse instance) =>
    <String, dynamic>{
      'links': instance.links,
      'success': instance.success,
      'failures': instance.failures,
      'details': instance.details,
      'flight_number': instance.flightNumber,
      'name': instance.name,
      'date_utc': instance.date,
      'id': instance.id,
    };

LinksData _$LinksDataFromJson(Map<String, dynamic> json) => LinksData(
      patch: PatchData.fromJson(json['patch'] as Map<String, dynamic>),
      webcast: json['webcast'] as String?,
      youtubeId: json['youtube_id'] as String?,
      article: json['article'] as String?,
      wikipedia: json['wikipedia'] as String?,
    );

Map<String, dynamic> _$LinksDataToJson(LinksData instance) => <String, dynamic>{
      'patch': instance.patch,
      'webcast': instance.webcast,
      'youtube_id': instance.youtubeId,
      'article': instance.article,
      'wikipedia': instance.wikipedia,
    };

PatchData _$PatchDataFromJson(Map<String, dynamic> json) => PatchData(
      small: json['small'] as String?,
      large: json['large'] as String?,
    );

Map<String, dynamic> _$PatchDataToJson(PatchData instance) => <String, dynamic>{
      'small': instance.small,
      'large': instance.large,
    };

FailuresData _$FailuresDataFromJson(Map<String, dynamic> json) => FailuresData(
      time: (json['time'] as num?)?.toInt(),
      altitude: (json['altitude'] as num?)?.toInt(),
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$FailuresDataToJson(FailuresData instance) =>
    <String, dynamic>{
      'time': instance.time,
      'altitude': instance.altitude,
      'reason': instance.reason,
    };
