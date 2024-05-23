import 'package:flutter/material.dart';
import 'package:space_app/core/helpers/spacing.dart';
import 'package:space_app/core/theming/styles.dart';

class TitleAndDescriptionColumn extends StatelessWidget {
  final String title;
  final String description;

  const TitleAndDescriptionColumn({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.font14WhiteBoldUbuntu,
        ),
        verticalSpace(8),
        Text(
          description,
          style: TextStyles.font14LightGreyRegularUbuntu,
        ),
      ],
    );
  }
}
