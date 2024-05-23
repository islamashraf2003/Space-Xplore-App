import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/constants.dart';
import 'package:space_app/core/helpers/spacing.dart';
import 'package:space_app/core/theming/colors.dart';
import 'package:space_app/core/theming/styles.dart';
import 'package:space_app/core/widgets/background_container.dart';
import 'package:space_app/core/widgets/custom_app_bar.dart';
import 'package:space_app/core/widgets/custom_text_span.dart';
import 'package:space_app/core/widgets/link_text.dart';
import 'package:space_app/features/launches/data/models/launch_response.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LaunchDetailsScreen extends StatelessWidget {
  final LaunchResponse item;

  const LaunchDetailsScreen({
    super.key,
    required this.item,
  });

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
              bottom: 13.h,
              start: 16.w,
              end: 16.w,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildYoutubePlayer(),
                  verticalSpace(30),
                  Center(
                    child: Text(
                      item.name,
                      style: TextStyles.font24WhiteBoldOrbitron,
                    ),
                  ),
                  verticalSpace(25),
                  CustomTextSpan(
                    textTitle: Constants.launchDetailsAttribute,
                    textDescription: item.details ?? Constants.noDataText,
                  ),
                  verticalSpace(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextSpan(
                        textTitle: Constants.launchDateAttribute,
                        textDescription: DateFormat("yyyy-MM-dd")
                            .format(DateTime.parse(item.date))
                            .toString(),
                      ),
                      CustomTextSpan(
                        textTitle: Constants.launchFlightNumAttribute,
                        textDescription: item.flightNumber.toString(),
                      ),
                    ],
                  ),
                  verticalSpace(20),
                  CustomTextSpan(
                    textTitle: Constants.launchSuccessAttribute,
                    textDescription: item.success == null
                        ? Constants.noDataText
                        : item.success!
                            ? Constants.trueText
                            : Constants.falseText,
                  ),
                  verticalSpace(20),
                  if (item.failures.isNotEmpty)
                    CustomTextSpan(
                      textTitle: Constants.launchFailuresAttribute,
                      textDescription:
                          item.failures[0].reason ?? Constants.noDataText,
                    ),
                  verticalSpace(20),
                  if (item.links.article != null)
                    LinkText(
                      linkUrl: item.links.article!,
                      linkName: Constants.articleText,
                    ),
                  verticalSpace(20),
                  if (item.links.wikipedia != null)
                    LinkText(
                      linkUrl: item.links.wikipedia!,
                      linkName: Constants.wikipediaText,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildYoutubePlayer() {
    if (item.links.youtubeId != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: YoutubePlayer(
          controller: YoutubePlayerController(
            initialVideoId: item.links.youtubeId!,
            flags: const YoutubePlayerFlags(
              autoPlay: false,
            ),
          ),
          showVideoProgressIndicator: true,
          progressIndicatorColor: ColorsManager.mainColor,
          progressColors: const ProgressBarColors(
            playedColor: ColorsManager.mainColor,
            handleColor: ColorsManager.mainColor,
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
