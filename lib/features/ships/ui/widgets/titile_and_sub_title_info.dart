import 'package:flutter/material.dart';
import 'package:space_app/core/helpers/spacing.dart';
import 'package:space_app/core/theming/styles.dart';

class TitleAndSubTitle extends StatelessWidget {
  final String title, subTitle;
  final TextStyle? textStyle;

  const TitleAndSubTitle({
    super.key,
    required this.title,
    required this.subTitle,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            title,
            style: TextStyles.font16WhiteBoldOrienta,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        horizontalSpace(8),
        Flexible(
          flex: 2,
          child: Text(
            subTitle,
            style: textStyle ?? TextStyles.font15WhiteMediumOrienta,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
