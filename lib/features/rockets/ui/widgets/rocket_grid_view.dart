import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'package:space_app/core/widgets/custom_grid_container.dart';

import '../../data/models/rocket_model.dart';
import '../screens/rocket_details_screen.dart';

class RocketGridView extends StatelessWidget {
  final List<RocketModel> rockets;

  const RocketGridView({
    super.key,
    required this.rockets,
  });

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
              itemCount: rockets.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 100.w / 120.h,
                crossAxisSpacing: 40.w,
                mainAxisSpacing: 35.h,
              ),
              itemBuilder: (context, index) {
                final rocket = rockets[index];
                return AnimationConfiguration.staggeredGrid(
                  position: index,
                  columnCount: rockets.length,
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
                            screen: RocketDetailsScreen(rocketModel: rocket),
                          );
                        },
                        child: CustomGridContainer(
                          title: rocket.name,
                          imageUrl: rocket.flickrImages[0],
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
}
