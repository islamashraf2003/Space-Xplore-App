import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:space_app/core/networking/api_constants.dart';
import 'package:space_app/features/company%20info/data/models/company_info_model.dart';
import 'package:retrofit/http.dart';
import 'package:space_app/features/crew/data/models/query_crew_response.dart';
import 'package:space_app/features/launches/data/models/launch_response.dart';
import 'package:space_app/features/launches/data/models/query_launch_response.dart';
import 'package:space_app/features/rockets/data/models/rocket_model.dart';
import 'package:space_app/features/ships/data/models/query_ship_response.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // Crew
  @POST(ApiConstants.queryCrew)
  Future<QueryCrewResponse> getAllCrew(@Body() body);

  // Launches
  @POST(ApiConstants.queryLaunches)
  Future<QueryLaunchResponse> getAllLaunches(@Body() body);

  @GET('${ApiConstants.launches}/{id}')
  Future<LaunchResponse> getOneLaunch({@Path('id') required String id});

  // Ships
  @POST(ApiConstants.queryShips)
  Future<QueryShipResponse> getAllShips(@Body() body);

  // Rockets
  @GET(ApiConstants.rockets)
  Future<List<RocketModel>> getAllRockets();

  @GET('${ApiConstants.rockets}/{id}')
  Future<RocketModel> getRocket(@Path('id') String id);

  // Company Info
  @GET(ApiConstants.companyInfo)
  Future<CompanyInfoModel> getCompanyInfo();
}
