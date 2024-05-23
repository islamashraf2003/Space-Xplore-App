import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/features/launches/data/models/launch_response.dart';
import 'package:space_app/features/launches/data/repos/launch_repo.dart';
import 'package:space_app/features/launches/logic/cubit/launch_state.dart';

class LaunchCubit extends Cubit<LaunchState> {
  final LaunchRepo _launchRepo;
  final List<LaunchResponse> allLaunches = [];
  int page = 1;

  LaunchCubit(this._launchRepo) : super(LaunchInitial());

  static LaunchCubit get(BuildContext context) => BlocProvider.of(context);

  void getAllLaunches() async {
    if (page != 1) {
      emit(LoadingMoreLaunches());
    } else {
      emit(GetAllLaunchesLoading());
    }
    final result = await _launchRepo.getAllLaunches(page: page);
    result.fold((failure) {
      emit(GetAllLaunchesFailure(errorMessage: failure.errorMessage));
    }, (successData) {
      page++;
      allLaunches.addAll(successData.launches!);
      if (successData.hasNextPage == false) {
        emit(NoMoreLaunches());
      } else {
        emit(GetAllLaunchesSuccess(launchesData: allLaunches));
      }
    });
  }

  void getOneLaunch({required String id}) async {
    final result = await _launchRepo.getOneLaunch(id: id);
    result.fold((failure) {
      emit(GetOneLaunchFailure(errorMessage: failure.errorMessage));
    }, (successData) {
      emit(GetOneLaunchSuccess(launchData: successData));
    });
  }
}
