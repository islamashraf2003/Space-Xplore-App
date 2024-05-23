import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/constants.dart';
import 'package:space_app/core/helpers/spacing.dart';
import 'package:space_app/core/theming/colors.dart';
import 'package:space_app/core/theming/styles.dart';
import 'package:space_app/core/widgets/custom_app_bar.dart';
import 'package:space_app/core/widgets/background_container.dart';
import 'package:space_app/core/widgets/custom_loading_widget.dart';
import 'package:space_app/core/widgets/failed_request_column.dart';
import 'package:space_app/features/company%20info/logic/cubit/company_info_cubit.dart';
import 'package:space_app/features/company%20info/logic/cubit/company_info_state.dart';
import 'package:space_app/features/company%20info/ui/widgets/company_info_details.dart';
import 'package:space_app/features/company%20info/ui/widgets/company_info_logos.dart';
import 'package:space_app/features/company%20info/ui/widgets/title_and_description_%20column.dart';

class CompanyInfoScreen extends StatefulWidget {
  const CompanyInfoScreen({super.key});

  @override
  State<CompanyInfoScreen> createState() => _CompanyInfoScreenState();
}

class _CompanyInfoScreenState extends State<CompanyInfoScreen> {
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      body: BackgroundContainer(
        child: SafeArea(
          child: BlocBuilder<CompanyInfoCubit, CompanyInfoState>(
            builder: (context, state) {
              return state is CompanyInfoStateSuccess
                  ? SingleChildScrollView(
                      child: Center(
                        child: Container(
                          width: 300.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: ColorsManager.lightTransparentColor,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 5.h,
                              horizontal: 15.w,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                verticalSpace(10),
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(24.r),
                                      child: Container(
                                        width: 100.w,
                                        height: 100.h,
                                        clipBehavior: Clip.hardEdge,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: AssetImage(
                                              Constants.companyLogoAssetPath,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    horizontalSpace(8),
                                    Text(
                                      state.companyInfo.name,
                                      style: TextStyles
                                          .font25WhiteExtraBoldOrbitron,
                                    ),
                                  ],
                                ),
                                verticalSpace(16),
                                TitleAndDescriptionColumn(
                                  title: Constants
                                      .companyInfoHeadQuartersAttribute,
                                  description:
                                      "${state.companyInfo.headquarters.address},${state.companyInfo.headquarters.city},${state.companyInfo.headquarters.state}",
                                ),
                                verticalSpace(16),
                                CompanyInfoDetails(
                                    companyInfo: state.companyInfo),
                                verticalSpace(16),
                                TitleAndDescriptionColumn(
                                  title:
                                      Constants.companyInfoEmployeesAttribute,
                                  description:
                                      state.companyInfo.employees.toString(),
                                ),
                                verticalSpace(16),
                                TitleAndDescriptionColumn(
                                  title: Constants.companyInfoAboutUsAttribute,
                                  description: state.companyInfo.summary,
                                ),
                                verticalSpace(16),
                                CompanyInfoLogos(
                                    links: state.companyInfo.links),
                                verticalSpace(10),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : state is CompanyInfoStateFailure
                      ? FailedRequestColumn(fetchData: _fetchData)
                      : const CustomLoadingWidget();
            },
          ),
        ),
      ),
    );
  }

  void _fetchData() {
    BlocProvider.of<CompanyInfoCubit>(context).getCompanyInfo();
  }
}
