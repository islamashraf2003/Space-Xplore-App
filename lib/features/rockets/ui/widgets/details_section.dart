import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/constants.dart';
import 'package:space_app/core/helpers/spacing.dart';
import 'package:space_app/core/theming/styles.dart';
import 'package:space_app/core/widgets/custom_text_span.dart';
import 'package:space_app/core/widgets/link_text.dart';
import 'package:flutter/material.dart';
import 'package:space_app/features/rockets/data/models/rocket_model.dart';

class DetailsSection extends StatelessWidget {
  final RocketModel rocket;

  const DetailsSection({
    super.key,
    required this.rocket,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 20.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              rocket.name,
              style: TextStyles.font24WhiteBoldOrbitron,
            ),
          ),
          verticalSpace(10),
          CustomTextSpan(
            textTitle: Constants.rocketDescriptionAttribute,
            textDescription: rocket.description,
          ),
          verticalSpace(24),
          CustomTextSpan(
            textTitle: Constants.rocketHeightAttribute,
            textDescription: "${rocket.height.meters} m",
          ),
          verticalSpace(9),
          CustomTextSpan(
            textTitle: Constants.rocketDiameterAttribute,
            textDescription: "${rocket.diameter.meters} m",
          ),
          verticalSpace(9),
          CustomTextSpan(
            textTitle: Constants.rocketMassAttribute,
            textDescription: "${rocket.mass.kg} Kg",
          ),
          verticalSpace(24),
          CustomTextSpan(
            textTitle: Constants.rocketCompanyAttribute,
            textDescription: rocket.company,
          ),
          verticalSpace(9),
          CustomTextSpan(
            textTitle: Constants.rocketCountryAttribute,
            textDescription: rocket.country,
          ),
          verticalSpace(10),
          LinkText(
            linkUrl: rocket.wikipedia,
            linkName: Constants.wikipediaText,
          ),
        ],
      ),
    );
  }
}
