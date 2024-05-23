import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/constants.dart';
import 'package:space_app/core/helpers/spacing.dart';
import 'package:space_app/core/theming/styles.dart';
import 'package:space_app/core/widgets/background_container.dart';
import 'package:space_app/core/widgets/custom_app_bar.dart';
import 'package:space_app/core/widgets/custom_loading_widget.dart';
import 'package:space_app/core/widgets/failed_request_column.dart';
import 'package:space_app/features/rockets/logic/cubit/rockets_cubit.dart';
import 'package:space_app/features/rockets/logic/cubit/rockets_state.dart';
import 'package:space_app/features/rockets/ui/widgets/rocket_grid_view.dart';

class RocketsScreen extends StatefulWidget {
  const RocketsScreen({super.key});

  @override
  State<RocketsScreen> createState() => _RocketsScreenState();
}

class _RocketsScreenState extends State<RocketsScreen> {
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
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
            ),
            child: BlocBuilder<RocketsCubit, RocketsState>(
              builder: (context, state) {
                if (state is RocketsFailure) {
                  return FailedRequestColumn(fetchData: _fetchData);
                } else if (state is RocketsSuccess) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(10),
                      Text(
                        Constants.rocketsModelName,
                        style: TextStyles.font18WhiteMediumOrienta,
                      ),
                      verticalSpace(20),
                      RocketGridView(
                        rockets: state.rocketModel,
                      ),
                    ],
                  );
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
    BlocProvider.of<RocketsCubit>(context).getAllRockets();
  }
}
