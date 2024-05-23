import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/features/ships/data/models/ship_model.dart';
import 'package:space_app/features/ships/data/repos/ships_repo.dart';
import 'package:space_app/features/ships/logic/cubit/ships_state.dart';

class ShipsCubit extends Cubit<ShipsState> {
  ShipsRepo shipsRepo;
  final List<ShipModel> allShips = [];
  int page = 1;
  ShipsCubit(this.shipsRepo) : super(ShipsInitial());
  static ShipsCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getAllShipsData() async {
    if (page != 1) {
      emit(LoadingMoreShips());
    } else {
      emit(ShipsLoading());
    }
    var result = await shipsRepo.getAllShips(page: page);
    result.fold((failure) {
      emit(ShipsFailure(errorMessage: failure.errorMessage));
    }, (successData) {
      page++;
      allShips.addAll(successData.ships!);
      if (successData.hasNextPage == false) {
        emit(NoMoreShips());
      } else {
        emit(ShipsSuccess(shipsData: allShips));
      }
    });
  }
}
