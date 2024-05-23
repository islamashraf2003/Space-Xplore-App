import 'package:flutter/material.dart';
import 'package:space_app/core/theming/styles.dart';

class CustomTextSpan extends StatelessWidget {
  final String textTitle;
  final String? textDescription;

  const CustomTextSpan({
    super.key,
    required this.textTitle,
    required this.textDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: textTitle,
            style: TextStyles.font16LightBlueRegularOrienta,
          ),
          TextSpan(
            text: textDescription,
            style: TextStyles.font14WhiteRegularOrienta,
          ),
        ],
      ),
    );
  }
}
