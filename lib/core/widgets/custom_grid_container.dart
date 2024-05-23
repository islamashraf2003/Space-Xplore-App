import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/spacing.dart';
import 'package:space_app/core/theming/colors.dart';
import 'package:space_app/core/theming/styles.dart';
import 'package:space_app/core/widgets/cached_image.dart';

class CustomGridContainer extends StatelessWidget {
  final String title;
  final String imageUrl;

  const CustomGridContainer({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorsManager.shadowColor,
            blurRadius: 10.r,
            offset: Offset(5.w, 5.h),
          ),
          BoxShadow(
            color: ColorsManager.shadowColor,
            blurRadius: 10.r,
            offset: Offset(5.w, 5.h),
          ),
        ],
        borderRadius: BorderRadius.circular(20.r),
        color: ColorsManager.cardColor,
      ),
      child: Column(
        children: [
          CachedImage(
            networkImageUrl: imageUrl,
            height: 120.h,
            width: double.infinity,
          ),
          verticalSpace(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              title,
              style: TextStyles.font12WhiteBoldOrienta,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
