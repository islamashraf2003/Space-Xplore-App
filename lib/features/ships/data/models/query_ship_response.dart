import 'package:json_annotation/json_annotation.dart';
import 'package:space_app/features/ships/data/models/ship_model.dart';
part 'query_ship_response.g.dart';

@JsonSerializable()
class QueryShipResponse {
  @JsonKey(name: "docs")
  List<ShipModel>? ships;
  int? totalDocs;
  int? limit;
  int? totalPages;
  int? page;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  int? prevPage;
  int? nextPage;

  QueryShipResponse({
    required this.ships,
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

  factory QueryShipResponse.fromJson(json) => _$QueryShipResponseFromJson(json);
}
