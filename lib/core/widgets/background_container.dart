import 'package:flutter/material.dart';
import 'package:space_app/core/helpers/constants.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget child;

  const BackgroundContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Constants.backgroundImageAssetPath),
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }
}
