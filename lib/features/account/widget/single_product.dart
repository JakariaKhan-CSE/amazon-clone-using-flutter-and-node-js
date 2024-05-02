
import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String image;
  const SingleProduct({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey,width: 1.5),  // border color grey
          borderRadius: BorderRadius.circular(5),
          color: Colors.white // picture and border er majher color
        ),
        child: Container(
          width: 180,
          padding: EdgeInsets.all(10),// border and picture er space
          child: Image.network(image,fit: BoxFit.fitHeight,width: 180,), // height wise fit hobe
        ),
      ),
      
    );
  }
}
