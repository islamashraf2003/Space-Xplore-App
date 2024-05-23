import 'package:json_annotation/json_annotation.dart';
import 'package:space_app/features/launches/data/models/launch_response.dart';
part 'query_launch_response.g.dart';

@JsonSerializable()
class QueryLaunchResponse {
  @JsonKey(name: "docs")
  List<LaunchResponse>? launches;
  int? totalDocs;
  int? limit;
  int? totalPages;
  int? page;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  int? prevPage;
  int? nextPage;

  QueryLaunchResponse({
    required this.launches,
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

  factory QueryLaunchResponse.fromJson(json) =>
      _$QueryLaunchResponseFromJson(json);
}
