import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:space_app/core/di/dependency_injection.dart';
import 'package:space_app/core/widgets/custom_grid_container.dart';
import 'package:space_app/features/crew/data/models/crew_member_model.dart';
import 'package:space_app/features/crew/logic/cubit/crew_cubit.dart';
import 'package:space_app/features/crew/ui/screens/crew_details_screen.dart';
import 'package:space_app/features/launches/logic/cubit/launch_cubit.dart';

class CrewGridView extends StatefulWidget {
  final List<CrewMemberModel> crewList;

  const CrewGridView({
    super.key,
    required this.crewList,
  });

  @override
  State<CrewGridView> createState() => _CrewGridViewState();
}

class _CrewGridViewState extends State<CrewGridView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          bottom: 10.h,
        ),
        child: AnimationLimiter(
          child: GridView.builder(
              controller: _scrollController,
              itemCount: widget.crewList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 100.w / 120.h,
                crossAxisSpacing: 40.w,
                mainAxisSpacing: 35.h,
              ),
              itemBuilder: (context, index) {
                final member = widget.crewList[index];
                return AnimationConfiguration.staggeredGrid(
                  position: index,
                  columnCount: widget.crewList.length,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    horizontalOffset: 50.0.h,
                    child: FadeInAnimation(
                      child: GestureDetector(
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.sizeUp,
                            screen: BlocProvider(
                              create: (context) => getIt<LaunchCubit>(),
                              child: CrewDetailsScreen(crewMember: member),
                            ),
                          );
                        },
                        child: CustomGridContainer(
                          title: member.name,
                          imageUrl: member.imageUrl,
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }

  void _scrollListener() {
    final maxScrollExtent = _scrollController.position.maxScrollExtent;
    final currentScrollPosition = _scrollController.position.pixels;

    if (currentScrollPosition >= maxScrollExtent) {
      BlocProvider.of<CrewCubit>(context).getAllCrew();
    }
  }
}
