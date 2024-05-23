import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/features/crew/data/models/crew_member_model.dart';
import 'package:space_app/features/crew/data/repos/crew_repo.dart';
import 'package:space_app/features/crew/logic/cubit/crew_state.dart';

class CrewCubit extends Cubit<CrewState> {
  final CrewRepo _crewRepo;
  final List<CrewMemberModel> allCrewMembers = [];
  int page = 1;

  CrewCubit(this._crewRepo) : super(CrewInitialState());

  static CrewCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getAllCrew() async {
    if (page != 1) {
      emit(LoadingMoreCrewMembers());
    } else {
      emit(CrewLoadingState());
    }
    final result = await _crewRepo.getAllCrew(page: page);
    result.fold((failure) {
      emit(CrewFailureState(errorMessage: failure.errorMessage));
    }, (successData) {
      page++;
      allCrewMembers.addAll(successData.crewMembers!);
      if (successData.hasNextPage == false) {
        emit(NoMoreCrewMembers());
      } else {
        emit(CrewLoadedState(allCrewMembers));
      }
    });
  }
}
