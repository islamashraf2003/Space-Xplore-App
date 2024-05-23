import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  final List<String> images;

  const ImageSlider({
    super.key,
    required this.images,
  });

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.images
              .map(
                (image) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(image),
                    ),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
            initialPage: 0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, _) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
        ),
        _buildCarouselIndicator(
          currentPage: _currentPage,
          images: widget.images,
        )
      ],
    );
  }
}

_buildCarouselIndicator(
    {required int currentPage, required List<String> images}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      for (int i = 0; i < images.length; i++)
        Container(
          height: i == currentPage ? 7 : 5,
          width: i == currentPage ? 7 : 5,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: i == currentPage ? Colors.white : Colors.grey,
            shape: BoxShape.circle,
          ),
        )
    ],
  );
}
