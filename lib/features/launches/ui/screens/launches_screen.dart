import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/constants.dart';
import 'package:space_app/core/helpers/spacing.dart';
import 'package:space_app/core/theming/styles.dart';
import 'package:space_app/core/widgets/background_container.dart';
import 'package:space_app/core/widgets/custom_app_bar.dart';
import 'package:space_app/features/launches/ui/widgets/all_launches_body.dart';

class LaunchesScreen extends StatelessWidget {
  const LaunchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      body: BackgroundContainer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              top: 13.h,
              bottom: 0.h,
              start: 16.w,
              end: 16.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Constants.launchesModelName,
                  style: TextStyles.font18WhiteMediumOrienta,
                ),
                verticalSpace(20),
                const AllLaunchesBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
