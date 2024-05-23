import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:space_app/core/networking/api_service.dart';
import 'package:space_app/core/networking/server_failure.dart';
import 'package:space_app/features/rockets/data/models/rocket_model.dart';

class RocketsRepo {
  final ApiService apiService;

  RocketsRepo(this.apiService);

  Future<Either<Failure, List<RocketModel>>> getAllRockets() async {
    try {
      final rocketsList = await apiService.getAllRockets();
      return Right(rocketsList);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
