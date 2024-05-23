import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/constants.dart';
import 'package:space_app/core/helpers/spacing.dart';
import 'package:space_app/core/theming/colors.dart';
import 'package:space_app/core/theming/styles.dart';
import 'package:space_app/core/widgets/cached_image.dart';
import 'package:space_app/features/ships/data/models/ship_model.dart';
import 'package:space_app/features/ships/ui/widgets/titile_and_sub_title_info.dart';

class InfoDataWithImage extends StatelessWidget {
  final ShipModel ship;

  const InfoDataWithImage({
    super.key,
    required this.ship,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(30),
              TitleAndSubTitle(
                title: Constants.shipTypeAttribute,
                subTitle: ship.shipType ?? Constants.noDataText,
              ),
              verticalSpace(10),
              TitleAndSubTitle(
                title: Constants.shipStatusAttribute,
                subTitle: ship.active!
                    ? Constants.activeText
                    : Constants.inactiveText,
                textStyle: ship.active!
                    ? TextStyles.font15WhiteMediumOrienta.copyWith(
                        color: ColorsManager.activeColor,
                      )
                    : TextStyles.font15WhiteMediumOrienta.copyWith(
                        color: ColorsManager.inactiveColor,
                      ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 90.w,
          height: 90.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: CachedImage(
              networkImageUrl: ship.image ?? '',
              height: 90.h,
              width: 90.h,
            ),
          ),
        ),
      ],
    );
  }
}
