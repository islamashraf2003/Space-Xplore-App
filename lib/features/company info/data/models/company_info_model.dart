import 'package:json_annotation/json_annotation.dart';
part 'company_info_model.g.dart';

@JsonSerializable()
class CompanyInfoModel {
  Headquarters headquarters;
  Links links;
  String name;
  String founder;
  int founded;
  int employees;
  int vehicles;
  @JsonKey(name: "launch_sites")
  int launchSites;
  @JsonKey(name: "test_sites")
  int testSites;
  String ceo;
  String summary;

  CompanyInfoModel({
    required this.headquarters,
    required this.links,
    required this.name,
    required this.founder,
    required this.founded,
    required this.employees,
    required this.vehicles,
    required this.testSites,
    required this.launchSites,
    required this.ceo,
    required this.summary,
  });

  factory CompanyInfoModel.fromJson(json) => _$CompanyInfoModelFromJson(json);
}

@JsonSerializable()
class Headquarters {
  String address;
  String city;
  String state;

  Headquarters({
    required this.address,
    required this.city,
    required this.state,
  });

  factory Headquarters.fromJson(json) => _$HeadquartersFromJson(json);
}

@JsonSerializable()
class Links {
  String website;
  String flickr;
  String twitter;

  Links({
    required this.website,
    required this.flickr,
    required this.twitter,
  });

  factory Links.fromJson(json) => _$LinksFromJson(json);
}
