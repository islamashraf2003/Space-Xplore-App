import 'package:space_app/features/crew/data/models/crew_member_model.dart';

abstract class CrewState {}

class CrewInitialState extends CrewState {}

class CrewLoadingState extends CrewState {}

class CrewLoadedState extends CrewState {
  final List<CrewMemberModel> crewMembers;

  CrewLoadedState(this.crewMembers);
}

final class LoadingMoreCrewMembers extends CrewState {}

final class NoMoreCrewMembers extends CrewState {}

class CrewFailureState extends CrewState {
  final String errorMessage;

  CrewFailureState({required this.errorMessage});
}
