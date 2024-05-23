import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/constants.dart';
import 'package:space_app/core/helpers/spacing.dart';
import 'package:space_app/core/theming/colors.dart';
import 'package:space_app/core/theming/styles.dart';
import 'package:space_app/core/widgets/custom_app_bar.dart';
import 'package:space_app/core/widgets/background_container.dart';
import 'package:space_app/core/widgets/custom_loading_widget.dart';
import 'package:space_app/core/widgets/failed_request_column.dart';
import 'package:space_app/core/widgets/link_text.dart';
import 'package:space_app/features/crew/data/models/crew_member_model.dart';
import 'package:space_app/features/crew/ui/widgets/crew_circle_image.dart';
import 'package:space_app/features/launches/logic/cubit/launch_cubit.dart';
import 'package:space_app/features/launches/logic/cubit/launch_state.dart';

class CrewDetailsScreen extends StatefulWidget {
  final CrewMemberModel crewMember;

  const CrewDetailsScreen({
    super.key,
    required this.crewMember,
  });

  @override
  State<CrewDetailsScreen> createState() => _CrewDetailsScreenState();
}

class _CrewDetailsScreenState extends State<CrewDetailsScreen> {
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      body: BackgroundContainer(
        child: SafeArea(
          child: Center(
            child: BlocBuilder<LaunchCubit, LaunchState>(
              builder: (context, state) {
                if (state is GetOneLaunchSuccess) {
                  return Container(
                    width: 320.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: ColorsManager.lightTransparentColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CrewCircleImage(
                            crewMemberImageUrl: widget.crewMember.imageUrl,
                          ),
                          verticalSpace(10),
                          _buildTextInRow(
                            text: widget.crewMember.name,
                            textStyle: TextStyles.font19WhiteBoldOrbitron,
                          ),
                          verticalSpace(10),
                          const Divider(color: ColorsManager.darkGreyColor),
                          Row(
                            children: [
                              _buildColumn(
                                title: Constants.crewAgencyAttribute,
                                content: widget.crewMember.agency,
                              ),
                              horizontalSpace(20),
                              _buildColumn(
                                title: Constants.crewStatusAttribute,
                                content: widget.crewMember.status,
                              ),
                              horizontalSpace(20),
                              _buildColumn(
                                title: Constants.crewLaunchesAttribute,
                                content: state.launchData.name,
                              ),
                            ],
                          ),
                          verticalSpace(25),
                          LinkText(
                            linkUrl: widget.crewMember.wikipediaUrl,
                            linkName: Constants.wikipediaText,
                          )
                        ],
                      ),
                    ),
                  );
                } else if (state is GetOneLaunchFailure) {
                  return FailedRequestColumn(fetchData: _fetchData);
                } else {
                  return const CustomLoadingWidget();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  void _fetchData() {
    BlocProvider.of<LaunchCubit>(context)
        .getOneLaunch(id: widget.crewMember.launches[0]);
  }

  Widget _buildColumn({required String title, required String content}) {
    return Expanded(
      child: Column(
        children: [
          _buildTextInRow(
            text: title,
            textStyle: TextStyles.font16WhiteBoldOrienta,
          ),
          verticalSpace(10),
          _buildTextInRow(
            text: content,
            textStyle: TextStyles.font12WhiteMediumOrienta,
          ),
        ],
      ),
    );
  }

  String _convertFirstLetterToCapital(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }

  Text _buildTextInRow({required String text, required TextStyle textStyle}) {
    return Text(
      _convertFirstLetterToCapital(text),
      style: textStyle,
    );
  }
}
