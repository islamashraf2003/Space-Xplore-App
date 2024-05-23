import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:space_app/core/di/dependency_injection.dart';
import 'package:space_app/core/helpers/constants.dart';
import 'package:space_app/core/theming/colors.dart';
import 'package:space_app/core/theming/styles.dart';
import 'package:space_app/features/company%20info/logic/cubit/company_info_cubit.dart';
import 'package:space_app/features/company%20info/ui/screens/company_info_screen.dart';
import 'package:space_app/features/crew/logic/cubit/crew_cubit.dart';
import 'package:space_app/features/crew/ui/screens/crew_screen.dart';
import 'package:space_app/features/launches/logic/cubit/launch_cubit.dart';
import 'package:space_app/features/launches/ui/screens/launches_screen.dart';
import 'package:space_app/features/no%20internet/ui/screens/no_internet_screen.dart';
import 'package:space_app/features/rockets/logic/cubit/rockets_cubit.dart';
import 'package:space_app/features/rockets/ui/screens/rockets_screen.dart';
import 'package:space_app/features/ships/logic/cubit/ships_cubit.dart';
import 'package:space_app/features/ships/ui/screens/ships_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Connectivity().onConnectivityChanged,
      builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) {
        final connectivityResult = snapshot.data;
        if (connectivityResult == ConnectivityResult.none) {
          return const NoInternetScreen();
        } else {
          return PersistentTabView(
            context,
            controller: PersistentTabController(initialIndex: 0),
            screens: _buildScreens(),
            items: _buildNavBarsItems(),
            backgroundColor: ColorsManager.semiBlackColor,
            decoration: NavBarDecoration(
              adjustScreenBottomPaddingOnCurve: false,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.r),
                topRight: Radius.circular(25.r),
              ),
            ),
            itemAnimationProperties: const ItemAnimationProperties(
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle.style1,
          );
        }
      },
    );
  }

  List<Widget> _buildScreens() {
    return [
      BlocProvider(
        create: (context) => getIt<RocketsCubit>(),
        child: const RocketsScreen(),
      ),
      BlocProvider(
        create: (context) => getIt<LaunchCubit>(),
        child: const LaunchesScreen(),
      ),
      BlocProvider(
        create: (context) => getIt<CrewCubit>(),
        child: const CrewScreen(),
      ),
      BlocProvider(
        create: (context) => getIt<ShipsCubit>(),
        child: const ShipsScreen(),
      ),
      BlocProvider(
        create: (context) => getIt<CompanyInfoCubit>(),
        child: const CompanyInfoScreen(),
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _buildNavBarsItems() {
    return [
      _buildNavBarItem(Icons.rocket_sharp, Constants.bottomNavBarItemText1),
      _buildNavBarItem(
          Icons.rocket_launch_sharp, Constants.bottomNavBarItemText2),
      _buildNavBarItem(Icons.people_sharp, Constants.bottomNavBarItemText3),
      _buildNavBarItem(
          Icons.directions_boat_filled_sharp, Constants.bottomNavBarItemText4),
      _buildNavBarItem(Icons.info_outline, Constants.bottomNavBarItemText5),
    ];
  }

  PersistentBottomNavBarItem _buildNavBarItem(IconData icon, String label) {
    return PersistentBottomNavBarItem(
      icon: Icon(icon),
      inactiveColorPrimary: ColorsManager.whiteColor,
      title: label,
      iconSize: 15.w,
      textStyle: TextStyles.font10WhiteBoldOrienta,
    );
  }
}
