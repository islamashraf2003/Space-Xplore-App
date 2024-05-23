// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crew_member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CrewMemberModel _$CrewMemberModelFromJson(Map<String, dynamic> json) =>
    CrewMemberModel(
      name: json['name'] as String,
      agency: json['agency'] as String,
      status: json['status'] as String,
      imageUrl: json['image'] as String,
      wikipediaUrl: json['wikipedia'] as String,
      launches:
          (json['launches'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CrewMemberModelToJson(CrewMemberModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'agency': instance.agency,
      'status': instance.status,
      'image': instance.imageUrl,
      'wikipedia': instance.wikipediaUrl,
      'launches': instance.launches,
    };
