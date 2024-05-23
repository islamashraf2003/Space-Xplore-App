import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_app/core/helpers/constants.dart';
import 'package:space_app/core/theming/colors.dart';
import 'package:space_app/core/widgets/bottom_nav_bar.dart';
import 'package:space_app/features/onboarding/ui/widgets/custom_page_view.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.darkBlueColor,
      body: SafeArea(
        child: IntroductionScreen(
          globalBackgroundColor: ColorsManager.backgroundColor,
          dotsDecorator: const DotsDecorator(
            activeColor: ColorsManager.mainColor,
          ),
          pages: [
            CustomPageView.generateCustomPageView(
              context: context,
              image: Constants.onboardingAsset1Path,
              title: Constants.welcomeText,
              body: Constants.onboardingText1,
            ),
            CustomPageView.generateCustomPageView(
              context: context,
              image: Constants.onboardingAsset2Path,
              title: Constants.onboardingText2,
              body: Constants.onboardingText3,
            ),
          ],
          doneStyle: const ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.zero),
          ),
          showNextButton: false,
          done: const Align(
            alignment: Alignment.centerRight,
            child: Text(
              Constants.doneText,
              style: TextStyle(
                color: ColorsManager.mainColor,
              ),
            ),
          ),
          onDone: () {
            _storeOnBoardingToShowOnlyOneTime();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const BottomNavBar();
                },
              ),
            );
          },
        ),
      ),
    );
  }

  _storeOnBoardingToShowOnlyOneTime() async {
    bool isOnboardingViewed = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(Constants.onboardingKey, isOnboardingViewed);
  }
}
