import 'package:space_app/features/rockets/data/models/rocket_model.dart';

abstract class RocketsState {}

final class RocketsInitial extends RocketsState {}

final class RocketsLoading extends RocketsState {}

final class RocketsSuccess extends RocketsState {
  final List<RocketModel> rocketModel;

  RocketsSuccess({required this.rocketModel});
}

final class RocketsFailure extends RocketsState {
  final String errorMessage;

  RocketsFailure({required this.errorMessage});
}
