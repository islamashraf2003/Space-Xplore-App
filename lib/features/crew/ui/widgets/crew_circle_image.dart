import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/widgets/cached_image.dart';

class CrewCircleImage extends StatelessWidget {
  const CrewCircleImage({
    super.key,
    required this.crewMemberImageUrl,
  });

  final String crewMemberImageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: CachedImage(
        networkImageUrl: crewMemberImageUrl,
        height: 250.h,
        width: 230.w,
      ),
    );
  }
}
