import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/constants.dart';
import 'package:space_app/core/helpers/spacing.dart';
import 'package:space_app/core/theming/colors.dart';
import 'package:space_app/core/theming/styles.dart';
import 'package:space_app/core/widgets/background_container.dart';
import 'package:space_app/core/widgets/custom_app_bar.dart';
import 'package:space_app/core/widgets/link_text.dart';
import 'package:space_app/features/ships/data/models/ship_model.dart';
import 'package:space_app/features/ships/ui/widgets/info_data_with_image.dart';
import 'package:space_app/features/ships/ui/widgets/titile_and_sub_title_info.dart';

class ShipDetailsScreen extends StatelessWidget {
  final ShipModel ship;

  const ShipDetailsScreen({
    super.key,
    required this.ship,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      body: BackgroundContainer(
        child: SafeArea(
          child: Center(
            child: Container(
              width: 330.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: ColorsManager.lightTransparentColor,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: 24.h,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          ship.shipName!,
                          style: TextStyles.font24WhiteBoldOrbitron,
                        ),
                      ),
                      verticalSpace(12),
                      const Divider(color: ColorsManager.darkGreyColor),
                      verticalSpace(12),
                      InfoDataWithImage(
                        ship: ship,
                      ),
                      verticalSpace(10),
                      TitleAndSubTitle(
                        title: Constants.shipHomePortAttribute,
                        subTitle: ship.homePort ?? Constants.noDataText,
                      ),
                      verticalSpace(10),
                      TitleAndSubTitle(
                        title: Constants.shipYearBuiltAttribute,
                        subTitle: ship.yearBuilt != null
                            ? ship.yearBuilt.toString()
                            : Constants.noDataText,
                      ),
                      verticalSpace(10),
                      TitleAndSubTitle(
                        title: Constants.shipWeightAttribute,
                        subTitle: ship.weightKg?.toString() != null
                            ? "${ship.weightKg?.toString()} kg"
                            : Constants.noDataText,
                      ),
                      verticalSpace(24),
                      if (ship.link != null)
                        LinkText(
                          linkUrl: ship.link!,
                          linkName: Constants.marineTrafficText,
                        ),
                      verticalSpace(35),
                      const Divider(color: ColorsManager.darkGreyColor),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
