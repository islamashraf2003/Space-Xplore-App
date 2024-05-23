import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/theming/colors.dart';
import 'package:space_app/core/theming/font_weight_manager.dart';
import 'package:space_app/core/theming/fonts.dart';

class TextStyles {
  // ------------------- Regular fonts -------------------
  static TextStyle font14WhiteRegularOrienta = TextStyle(
    color: ColorsManager.whiteColor,
    fontSize: 14.sp,
    fontWeight: FontWeightManager.regular,
    fontFamily: Fonts.orientaFont,
  );
  static TextStyle font14LightGreyRegularUbuntu = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightManager.regular,
    color: ColorsManager.lightGreyColor,
    fontFamily: Fonts.ubuntuFont,
  );
  static TextStyle font14LightWhiteRegularUbuntu = TextStyle(
    fontFamily: Fonts.ubuntuFont,
    fontSize: 14.sp,
    fontWeight: FontWeightManager.regular,
    color: ColorsManager.lightWhiteColor,
  );
  static TextStyle font16WhiteRegularOrienta = TextStyle(
    color: ColorsManager.whiteColor,
    fontSize: 16.sp,
    fontWeight: FontWeightManager.regular,
    fontFamily: Fonts.orientaFont,
  );
  static TextStyle font16LightBlueRegularOrienta = TextStyle(
    color: ColorsManager.lightBlueColor,
    fontSize: 16.sp,
    fontWeight: FontWeightManager.regular,
    fontFamily: Fonts.orientaFont,
  );
  static TextStyle font24WhiteRegularOrbitron = TextStyle(
    color: ColorsManager.whiteColor,
    fontSize: 24.sp,
    fontWeight: FontWeightManager.regular,
    fontFamily: Fonts.orbitronFont,
  );

  // ------------------- Medium Fonts -------------------
  static TextStyle font12WhiteMediumOrienta = TextStyle(
    color: ColorsManager.whiteColor,
    fontSize: 12.sp,
    fontWeight: FontWeightManager.medium,
    fontFamily: Fonts.orientaFont,
  );
  static TextStyle font13BlueMediumOrienta = TextStyle(
    color: ColorsManager.mainColor,
    decorationColor: ColorsManager.mainColor,
    decoration: TextDecoration.underline,
    fontSize: 13.sp,
    fontWeight: FontWeightManager.medium,
    fontFamily: Fonts.orientaFont,
  );
  static TextStyle font15WhiteMediumOrienta = TextStyle(
    color: ColorsManager.whiteColor,
    fontSize: 15.sp,
    fontWeight: FontWeightManager.medium,
    fontFamily: Fonts.orientaFont,
  );
  static TextStyle font15BlueMediumOrienta = TextStyle(
    color: ColorsManager.mainColor,
    fontSize: 15.sp,
    fontWeight: FontWeightManager.medium,
    fontFamily: Fonts.orientaFont,
  );
  static TextStyle font18WhiteMediumOrienta = TextStyle(
    color: ColorsManager.whiteColor,
    fontSize: 18.sp,
    fontWeight: FontWeightManager.medium,
    fontFamily: Fonts.orientaFont,
  );

  //------------------- Bold fonts -------------------
  static TextStyle font10WhiteBoldOrienta = TextStyle(
    color: ColorsManager.whiteColor,
    fontSize: 10.sp,
    fontWeight: FontWeightManager.bold,
    fontFamily: Fonts.orientaFont,
  );
  static TextStyle font12WhiteBoldOrienta = TextStyle(
    color: ColorsManager.whiteColor,
    fontSize: 12.sp,
    fontWeight: FontWeightManager.bold,
    fontFamily: Fonts.orientaFont,
  );
  static TextStyle font14WhiteBoldUbuntu = TextStyle(
    color: ColorsManager.whiteColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    fontFamily: Fonts.ubuntuFont,
  );
  static TextStyle font16WhiteBoldOrienta = TextStyle(
    color: ColorsManager.whiteColor,
    fontSize: 16.sp,
    fontWeight: FontWeightManager.bold,
    fontFamily: Fonts.orientaFont,
  );
  static TextStyle font19WhiteBoldOrbitron = TextStyle(
    color: ColorsManager.whiteColor,
    fontSize: 19.sp,
    fontWeight: FontWeightManager.bold,
    fontFamily: Fonts.orbitronFont,
  );
  static TextStyle font20WhiteBoldOrbitron = TextStyle(
    color: ColorsManager.whiteColor,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    fontFamily: Fonts.orbitronFont,
  );
  static TextStyle font24WhiteBoldOrbitron = TextStyle(
    color: ColorsManager.whiteColor,
    fontSize: 24.sp,
    fontWeight: FontWeightManager.bold,
    fontFamily: Fonts.orbitronFont,
  );
  static TextStyle font24BlackBoldOrbitron = TextStyle(
    color: ColorsManager.blackColor,
    fontSize: 24.sp,
    fontWeight: FontWeightManager.bold,
    fontFamily: Fonts.orbitronFont,
  );

  //------------------- Extra Bold fonts -------------------
  static TextStyle font25WhiteExtraBoldOrbitron = TextStyle(
    fontSize: 25.sp,
    fontWeight: FontWeightManager.extraBold,
    color: ColorsManager.whiteColor,
    fontFamily: Fonts.orbitronFont,
  );
}
