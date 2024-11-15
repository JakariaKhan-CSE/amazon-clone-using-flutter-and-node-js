import 'package:amazon_clone/constants/global_variable.dart';
import 'package:carousel_slider/carousel_slider.dart'; // No alias needed
import 'package:flutter/material.dart';

class CarousalImage extends StatelessWidget {
  const CarousalImage({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a CarouselController instance
    final CarouselController controller = CarouselController();

    return CarouselSlider(
      items: GlobalVariables.carouselImages.map((i) {
        return Image.network(
          i,
          fit: BoxFit.cover,
          height: 200,
        );
      }).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 200,
       // carouselController: controller, // Use the controller if needed
      ),
    );
  }
}
