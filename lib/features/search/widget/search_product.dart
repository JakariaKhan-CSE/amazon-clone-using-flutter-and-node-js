import 'package:amazon_clone/common/widget/stars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/products.dart';

class SearchProduct extends StatelessWidget {
  final Product product;
  const SearchProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                product.images[0],
                fit: BoxFit.cover,
                width: 135,
                height: 135,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          product.name,
                          maxLines: 2,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        )),
                    Container(
                        margin: const EdgeInsets.only(left: 10,top: 5),
                        child: const Stars(rating: 4,)
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 10,top: 5),
                        child: Text('\$${product.price}',style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),)
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text('Eligible for FREE shipping')
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text('In Stock',style: TextStyle(color: Colors.teal),)
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
