import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  final List images = [
    "images/horizon.png",
    "images/horizon-forbidden-west-1.jpg",
    "images/horizon-forbidden-west-2.jpg",
    "images/horizon-zero-dawn-1.jpg",
    "images/horizon-zero-dawn-2.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Carousel'),
        ),
        body: CarouselSlider(
          options: CarouselOptions(
            height: 600.0,
            initialPage: 0,
            viewportFraction: 1,
            enableInfiniteScroll: false,
            reverse: false,
          ),
          items: images.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Image.asset(
                  i,
                  fit: BoxFit.fitWidth,
                );
              },
            );
          }).toList(),
        ));
  }
}
