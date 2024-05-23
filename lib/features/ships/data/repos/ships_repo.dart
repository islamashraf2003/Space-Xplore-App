import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:space_app/core/networking/server_failure.dart';
import 'package:space_app/core/networking/api_service.dart';
import 'package:space_app/features/ships/data/models/query_ship_response.dart';

class ShipsRepo {
  ApiService apiService;

  ShipsRepo(this.apiService);

  Future<Either<Failure, QueryShipResponse>> getAllShips(
      {required int page}) async {
    try {
      var response = await apiService.getAllShips({
        'options': {
          "page": page,
          "limit": 10,
        }
      });
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
