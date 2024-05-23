import 'package:space_app/features/company%20info/data/models/company_info_model.dart';

abstract class CompanyInfoState {}

final class CompanyInfoStateInitial extends CompanyInfoState {}

final class CompanyInfoStateLoading extends CompanyInfoState {}

final class CompanyInfoStateSuccess extends CompanyInfoState {
  final CompanyInfoModel companyInfo;

  CompanyInfoStateSuccess({required this.companyInfo});
}

final class CompanyInfoStateFailure extends CompanyInfoState {
  final String errorMessage;

  CompanyInfoStateFailure({required this.errorMessage});
}
