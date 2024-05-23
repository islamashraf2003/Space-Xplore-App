import 'package:json_annotation/json_annotation.dart';
import 'package:space_app/features/crew/data/models/crew_member_model.dart';

part 'query_crew_response.g.dart';

@JsonSerializable()
class QueryCrewResponse {
  @JsonKey(name: "docs")
  List<CrewMemberModel>? crewMembers;
  int? totalDocs;
  int? limit;
  int? totalPages;
  int? page;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  int? prevPage;
  int? nextPage;

  QueryCrewResponse({
    required this.crewMembers,
    required this.totalDocs,
    required this.limit,
    required this.totalPages,
    required this.page,
    required this.pagingCounter,
    required this.hasPrevPage,
    required this.hasNextPage,
    required this.prevPage,
    required this.nextPage,
  });

  factory QueryCrewResponse.fromJson(json) => _$QueryCrewResponseFromJson(json);
}
