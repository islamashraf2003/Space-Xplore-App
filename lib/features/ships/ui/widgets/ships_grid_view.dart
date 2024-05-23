import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:space_app/core/helpers/constants.dart';
import 'package:space_app/core/widgets/custom_grid_container.dart';
import 'package:space_app/features/ships/data/models/ship_model.dart';
import 'package:space_app/features/ships/logic/cubit/ships_cubit.dart';
import 'package:space_app/features/ships/ui/screens/ship_details_screen.dart';

class ShipsGridView extends StatefulWidget {
  const ShipsGridView({
    super.key,
    required this.ships,
  });

  final List<ShipModel> ships;

  @override
  State<ShipsGridView> createState() => _ShipsGridViewState();
}

class _ShipsGridViewState extends State<ShipsGridView> {
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
    return AnimationLimiter(
      child: GridView.builder(
          controller: _scrollController,
          itemCount: widget.ships.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 100.w / 120.h,
            crossAxisSpacing: 40.w,
            mainAxisSpacing: 35.h,
          ),
          itemBuilder: (context, index) {
            final ship = widget.ships[index];
            return AnimationConfiguration.staggeredGrid(
              position: index,
              columnCount: widget.ships.length,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                horizontalOffset: 50.0.h,
                child: FadeInAnimation(
                  child: GestureDetector(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        withNavBar: false,
                        pageTransitionAnimation: PageTransitionAnimation.sizeUp,
                        screen: ShipDetailsScreen(ship: ship),
                      );
                    },
                    child: CustomGridContainer(
                      title: ship.shipName ?? Constants.noDataText,
                      imageUrl: ship.image ?? '',
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  void _scrollListener() {
    final maxScrollExtent = _scrollController.position.maxScrollExtent;
    final currentScrollPosition = _scrollController.position.pixels;

    if (currentScrollPosition >= maxScrollExtent) {
      context.read<ShipsCubit>().getAllShipsData();
    }
  }
}
