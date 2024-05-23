import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:space_app/core/theming/colors.dart';
import 'package:space_app/core/widgets/custom_loading_widget.dart';
import 'package:space_app/core/widgets/failed_request_column.dart';
import 'package:space_app/features/crew/data/models/crew_member_model.dart';
import 'package:space_app/features/crew/logic/cubit/crew_cubit.dart';
import 'package:space_app/features/crew/logic/cubit/crew_state.dart';
import 'package:space_app/features/crew/ui/widgets/crew_grid_view.dart';

class AllCrewMembers extends StatefulWidget {
  const AllCrewMembers({super.key});

  @override
  State<AllCrewMembers> createState() => _AllCrewMembersState();
}

class _AllCrewMembersState extends State<AllCrewMembers> {
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CrewCubit, CrewState>(
        builder: (context, state) {
          final cubit = CrewCubit.get(context);
          List<CrewMemberModel> crewList = cubit.allCrewMembers;
          return state is CrewLoadingState
              ? const CustomLoadingWidget()
              : state is CrewFailureState
                  ? FailedRequestColumn(fetchData: _fetchData)
                  : RefreshIndicator(
                      color: ColorsManager.mainColor,
                      onRefresh: () async {
                        cubit.page = 1;
                        _fetchData();
                      },
                      child: Column(
                        children: [
                          CrewGridView(
                            crewList: crewList,
                          ),
                          state is LoadingMoreCrewMembers
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
    BlocProvider.of<CrewCubit>(context).getAllCrew();
  }
}
