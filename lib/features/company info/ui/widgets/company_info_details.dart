import 'package:flutter/material.dart';
import 'package:space_app/core/helpers/constants.dart';
import 'package:space_app/core/helpers/spacing.dart';
import 'package:space_app/features/company%20info/data/models/company_info_model.dart';
import 'package:space_app/features/company%20info/ui/widgets/title_and_description_%20column.dart';

class CompanyInfoDetails extends StatelessWidget {
  final CompanyInfoModel companyInfo;

  const CompanyInfoDetails({
    super.key,
    required this.companyInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TitleAndDescriptionColumn(
              title: Constants.companyInfoFounderAttribute,
              description: companyInfo.founder,
            ),
            verticalSpace(16),
            TitleAndDescriptionColumn(
              title: Constants.companyInfoVehiclesAttribute,
              description: companyInfo.vehicles.toString(),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TitleAndDescriptionColumn(
              title: Constants.companyInfoFoundedAttribute,
              description: companyInfo.founded.toString(),
            ),
            verticalSpace(16),
            TitleAndDescriptionColumn(
              title: Constants.companyInfoLaunchSitesAttribute,
              description: companyInfo.launchSites.toString(),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TitleAndDescriptionColumn(
              title: Constants.companyInfoCEOAttribute,
              description: companyInfo.ceo,
            ),
            verticalSpace(16),
            TitleAndDescriptionColumn(
              title: Constants.companyInfoTestSitesAttribute,
              description: companyInfo.testSites.toString(),
            ),
          ],
        ),
      ],
    );
  }
}
