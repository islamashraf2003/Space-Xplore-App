import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:space_app/core/networking/api_service.dart';
import 'package:space_app/core/networking/server_failure.dart';
import 'package:space_app/features/launches/data/models/launch_response.dart';
import 'package:space_app/features/launches/data/models/query_launch_response.dart';

class LaunchRepo {
  final ApiService apiService;

  LaunchRepo(this.apiService);

  Future<Either<Failure, QueryLaunchResponse>> getAllLaunches(
      {required int page}) async {
    try {
      final launchesList = await apiService.getAllLaunches({
        'options': {
          "page": page,
          "limit": 10,
        }
      });
      return Right(launchesList);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  Future<Either<Failure, LaunchResponse>> getOneLaunch(
      {required String id}) async {
    try {
      final launch = await apiService.getOneLaunch(id: id);
      return Right(launch);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
