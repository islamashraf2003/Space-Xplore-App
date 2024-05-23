import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:space_app/core/theming/styles.dart';

class CustomPageView {
  static PageViewModel generateCustomPageView({
    required BuildContext context,
    required String image,
    required String title,
    required String body,
  }) {
    return PageViewModel(
      titleWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            child: Lottie.asset(
              image,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            title,
            style: TextStyles.font24WhiteRegularOrbitron,
          ),
        ],
      ),
      bodyWidget: Text(
        body,
        style: TextStyles.font14LightWhiteRegularUbuntu,
      ),
    );
  }
}
