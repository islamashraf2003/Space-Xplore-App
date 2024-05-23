import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/spacing.dart';
import 'package:space_app/core/theming/colors.dart';
import 'package:space_app/core/theming/styles.dart';
import 'package:space_app/core/widgets/no_image_asset.dart';
import 'package:space_app/features/launches/data/models/launch_response.dart';

class CustomCard extends StatelessWidget {
  final LaunchResponse item;

  const CustomCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 25.h,
        left: 25.w,
        right: 25.w,
      ),
      decoration: BoxDecoration(
        color: ColorsManager.cardColor,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: ColorsManager.blackColor.withOpacity(0.25),
            blurRadius: 11.33.r,
            offset: const Offset(13, 11),
          ),
          BoxShadow(
            color: ColorsManager.blackColor.withOpacity(0.15),
            blurRadius: 6.r,
            offset: const Offset(-10, -13),
          ),
        ],
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ColorsManager.blackColor,
            ColorsManager.darkGreyColor,
            ColorsManager.greyColor,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          item.links.patch.small == null
              ? const NoImageAsset(width: 80, height: 80)
              : CachedNetworkImage(
                  imageUrl: item.links.patch.small!,
                  width: 80.w,
                  height: 80.h,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.mainColor,
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                      const NoImageAsset(width: 80, height: 80),
                ),
          verticalSpace(10),
          Text(
            item.name,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.font16WhiteRegularOrienta,
          ),
        ],
      ),
    );
  }
}
