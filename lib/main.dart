import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_app/core/di/dependency_injection.dart';
import 'package:space_app/core/helpers/constants.dart';
import 'package:space_app/core/widgets/bottom_nav_bar.dart';
import 'package:space_app/features/onboarding/ui/screens/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  final isOnboardingViewed = await checkOnboardingViewed();
  runApp(SpaceApp(isOnboardingViewed: isOnboardingViewed));
}

// View Onboarding screens only once when installed first time
Future<bool> checkOnboardingViewed() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final isOnboardingViewed =
      preferences.getBool(Constants.onboardingKey) ?? false;
  return isOnboardingViewed;
}

class SpaceApp extends StatelessWidget {
  const SpaceApp({
    super.key,
    required this.isOnboardingViewed,
  });

  final bool isOnboardingViewed;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 840),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: isOnboardingViewed
            ? const BottomNavBar()
            : const OnboardingScreen(),
      ),
    );
  }
}
