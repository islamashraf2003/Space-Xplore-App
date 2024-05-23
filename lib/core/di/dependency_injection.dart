import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:space_app/core/networking/api_service.dart';
import 'package:space_app/core/networking/dio_factory.dart';
import 'package:space_app/features/company%20info/data/repo/company_info_repo.dart';
import 'package:space_app/features/company%20info/logic/cubit/company_info_cubit.dart';
import 'package:space_app/features/launches/data/repos/launch_repo.dart';
import 'package:space_app/features/launches/logic/cubit/launch_cubit.dart';
import 'package:space_app/features/crew/data/repos/crew_repo.dart';
import 'package:space_app/features/crew/logic/cubit/crew_cubit.dart';
import 'package:space_app/features/rockets/data/repos/rockets_repo.dart';
import 'package:space_app/features/rockets/logic/cubit/rockets_cubit.dart';
import 'package:space_app/features/ships/data/repos/ships_repo.dart';
import 'package:space_app/features/ships/logic/cubit/ships_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton(() => ApiService(dio));

  // Rockets
  getIt.registerLazySingleton(() => RocketsRepo(getIt()));
  getIt.registerLazySingleton(() => RocketsCubit(getIt()));

  // Launches
  getIt.registerLazySingleton(() => LaunchRepo(getIt()));
  getIt.registerLazySingleton(() => LaunchCubit(getIt()));

  // Crew
  getIt.registerLazySingleton<CrewRepo>(() => CrewRepo(getIt()));
  getIt.registerLazySingleton<CrewCubit>(() => CrewCubit(getIt()));

  // Ships
  getIt.registerLazySingleton<ShipsRepo>(() => ShipsRepo(getIt()));
  getIt.registerLazySingleton<ShipsCubit>(() => ShipsCubit(getIt()));

  // Company Info
  getIt
      .registerLazySingleton<CompanyInfoCubit>(() => CompanyInfoCubit(getIt()));
  getIt.registerLazySingleton<CompanyInfoRepo>(() => CompanyInfoRepo(getIt()));
}
