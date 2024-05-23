import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:space_app/core/theming/colors.dart';
import 'package:space_app/core/widgets/custom_loading_widget.dart';
import 'package:space_app/core/widgets/failed_request_column.dart';
import 'package:space_app/features/launches/data/models/launch_response.dart';
import 'package:space_app/features/launches/logic/cubit/launch_cubit.dart';
import 'package:space_app/features/launches/logic/cubit/launch_state.dart';
import 'package:space_app/features/launches/ui/widgets/launches_grid_view.dart';

class AllLaunchesBody extends StatefulWidget {
  const AllLaunchesBody({super.key});

  @override
  State<AllLaunchesBody> createState() => _AllLaunchesBodyState();
}

class _AllLaunchesBodyState extends State<AllLaunchesBody> {
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<LaunchCubit, LaunchState>(
        builder: (context, state) {
          final cubit = LaunchCubit.get(context);
          List<LaunchResponse> allLaunches = cubit.allLaunches;
          return state is GetAllLaunchesLoading
              ? const CustomLoadingWidget()
              : state is GetAllLaunchesFailure
                  ? FailedRequestColumn(fetchData: _fetchData)
                  : RefreshIndicator(
                      color: ColorsManager.mainColor,
                      onRefresh: () async {
                        cubit.page = 1;
                        _fetchData();
                      },
                      child: Column(
                        children: [
                          LaunchesGridView(
                            allLaunches: allLaunches,
                          ),
                          state is LoadingMoreLaunches
                              ? Center(
                                  child: SpinKitThreeBounce(
                                    size: 30.sp,
                                    color: ColorsManager.mainColor,
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    );
        },
      ),
    );
  }

  void _fetchData() {
    context.read<LaunchCubit>().getAllLaunches();
  }
}
