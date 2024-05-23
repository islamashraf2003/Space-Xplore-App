import 'package:bloc/bloc.dart';
import 'package:space_app/features/rockets/data/repos/rockets_repo.dart';
import 'package:space_app/features/rockets/logic/cubit/rockets_state.dart';

class RocketsCubit extends Cubit<RocketsState> {
  final RocketsRepo rocketsRepo;

  RocketsCubit(this.rocketsRepo) : super(RocketsInitial());

  Future<void> getAllRockets() async {
    emit(RocketsLoading());
    var result = await rocketsRepo.getAllRockets();
    result.fold((failure) {
      emit(RocketsFailure(errorMessage: failure.errorMessage));
    }, (rocket) {
      emit(RocketsSuccess(rocketModel: rocket));
    });
  }
}
