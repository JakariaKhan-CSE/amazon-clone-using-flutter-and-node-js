import 'package:amazon_clone/constants/global_variable.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarousalImage extends StatelessWidget {
  const CarousalImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariables.carouselImages.map((i) {
        return Image.network(i,fit: BoxFit.cover,height: 200,);
      }).toList(),
      options: CarouselOptions(
        viewportFraction: 1,  // aita na dile screen a 2 ta picture cole ashse. aita diyer pore screen a akta picture show korbe
        height: 200
      ),

    );
  }
}
