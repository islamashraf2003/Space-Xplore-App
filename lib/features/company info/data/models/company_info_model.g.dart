// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyInfoModel _$CompanyInfoModelFromJson(Map<String, dynamic> json) =>
    CompanyInfoModel(
      headquarters: Headquarters.fromJson(json['headquarters']),
      links: Links.fromJson(json['links']),
      name: json['name'] as String,
      founder: json['founder'] as String,
      founded: (json['founded'] as num).toInt(),
      employees: (json['employees'] as num).toInt(),
      vehicles: (json['vehicles'] as num).toInt(),
      testSites: (json['test_sites'] as num).toInt(),
      launchSites: (json['launch_sites'] as num).toInt(),
      ceo: json['ceo'] as String,
      summary: json['summary'] as String,
    );

Map<String, dynamic> _$CompanyInfoModelToJson(CompanyInfoModel instance) =>
    <String, dynamic>{
      'headquarters': instance.headquarters,
      'links': instance.links,
      'name': instance.name,
      'founder': instance.founder,
      'founded': instance.founded,
      'employees': instance.employees,
      'vehicles': instance.vehicles,
      'launch_sites': instance.launchSites,
      'test_sites': instance.testSites,
      'ceo': instance.ceo,
      'summary': instance.summary,
    };

Headquarters _$HeadquartersFromJson(Map<String, dynamic> json) => Headquarters(
      address: json['address'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
    );

Map<String, dynamic> _$HeadquartersToJson(Headquarters instance) =>
    <String, dynamic>{
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
    };

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      website: json['website'] as String,
      flickr: json['flickr'] as String,
      twitter: json['twitter'] as String,
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'website': instance.website,
      'flickr': instance.flickr,
      'twitter': instance.twitter,
    };
