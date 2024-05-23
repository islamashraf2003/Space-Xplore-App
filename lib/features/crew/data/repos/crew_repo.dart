import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:space_app/core/networking/api_service.dart';
import 'package:space_app/core/networking/server_failure.dart';
import 'package:space_app/features/crew/data/models/query_crew_response.dart';

class CrewRepo {
  final ApiService apiService;

  CrewRepo(this.apiService);

  Future<Either<Failure, QueryCrewResponse>> getAllCrew(
      {required int page}) async {
    try {
      final crewMembersList = await apiService.getAllCrew({
        'options': {
          "page": page,
          "limit": 10,
        }
      });
      return Right(crewMembersList);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
