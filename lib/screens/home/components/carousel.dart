import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  Carousel({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  final List<String> images = [
    "assets/images/horizon.png",
    "assets/images/horizon-forbidden-west-1.jpg",
    "assets/images/horizon-forbidden-west-2.jpg",
    "assets/images/horizon-zero-dawn-1.jpg",
    "assets/images/horizon-zero-dawn-2.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: height,
        initialPage: 0,
        viewportFraction: 1,
        enableInfiniteScroll: false,
        reverse: false,
      ),
      items: images.map((image) {
        return Builder(
          builder: (context) {
            return Image.asset(
              image,
              fit: BoxFit.fitHeight,
            );
          },
        );
      }).toList(),
    );
  }
}
