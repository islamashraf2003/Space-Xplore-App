import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/features/company%20info/data/repo/company_info_repo.dart';
import 'package:space_app/features/company%20info/logic/cubit/company_info_state.dart';

class CompanyInfoCubit extends Cubit<CompanyInfoState> {
  final CompanyInfoRepo _companyInfoRepo;

  CompanyInfoCubit(this._companyInfoRepo) : super(CompanyInfoStateInitial());

  void getCompanyInfo() async {
    emit(CompanyInfoStateLoading());
    final result = await _companyInfoRepo.getCompanyInfo();
    result.fold((failure) {
      emit(CompanyInfoStateFailure(errorMessage: failure.errorMessage));
    }, (successData) {
      emit(CompanyInfoStateSuccess(companyInfo: successData));
    });
  }
}
