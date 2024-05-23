import 'package:space_app/features/launches/data/models/launch_response.dart';

abstract class LaunchState {}

final class LaunchInitial extends LaunchState {}

// All launches
final class GetAllLaunchesSuccess extends LaunchState {
  final List<LaunchResponse> launchesData;

  GetAllLaunchesSuccess({required this.launchesData});
}

final class GetAllLaunchesLoading extends LaunchState {}

final class GetAllLaunchesFailure extends LaunchState {
  final String errorMessage;

  GetAllLaunchesFailure({required this.errorMessage});
}

final class LoadingMoreLaunches extends LaunchState {}

final class NoMoreLaunches extends LaunchState {}

// One launch
final class GetOneLaunchSuccess extends LaunchState {
  final LaunchResponse launchData;

  GetOneLaunchSuccess({required this.launchData});
}

final class GetOneLaunchLoading extends LaunchState {}

final class GetOneLaunchFailure extends LaunchState {
  final String errorMessage;

  GetOneLaunchFailure({required this.errorMessage});
}
