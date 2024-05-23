import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:space_app/core/helpers/spacing.dart';
import 'package:space_app/features/rockets/data/models/rocket_model.dart';
import '../../../../core/widgets/background_container.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/details_section.dart';
import '../widgets/image_slider_widget.dart';

class RocketDetailsScreen extends StatelessWidget {
  const RocketDetailsScreen({super.key, required this.rocketModel});
  final RocketModel rocketModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      body: BackgroundContainer(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(10),
                ImageSlider(
                  images: rocketModel.flickrImages,
                ),
                DetailsSection(
                  rocket: rocketModel,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
