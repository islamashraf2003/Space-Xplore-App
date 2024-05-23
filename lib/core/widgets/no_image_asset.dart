import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/constants.dart';

class NoImageAsset extends StatelessWidget {
  final double width;
  final double height;
  const NoImageAsset({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Constants.noPhotoAssetPath,
      width: width.w,
      height: height.h,
    );
  }
}
