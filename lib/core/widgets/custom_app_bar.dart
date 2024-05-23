import 'package:flutter/material.dart';
import 'package:space_app/core/helpers/constants.dart';
import 'package:space_app/core/theming/colors.dart';
import 'package:space_app/core/theming/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      iconTheme: const IconThemeData(color: ColorsManager.whiteColor),
      title: Text(
        Constants.appName,
        style: TextStyles.font24WhiteBoldOrbitron,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
