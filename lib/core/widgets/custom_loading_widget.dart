import 'package:flutter/material.dart';
import 'package:space_app/core/theming/colors.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorsManager.mainColor,
      ),
    );
  }
}
