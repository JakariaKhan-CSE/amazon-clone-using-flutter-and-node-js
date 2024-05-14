import 'package:amazon_clone/common/widget/loader.dart';
import 'package:amazon_clone/features/home/services/home_services.dart';
import 'package:amazon_clone/features/products_details/screen/product_details_screen.dart';

import 'package:amazon_clone/model/products.dart';

import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  HomeServices homeServices = HomeServices();
  Product? product;
  @override
  void initState() {
   fetchDealofDay();
    super.initState();
  }
  void fetchDealofDay()async{
    product = await homeServices.fetchDealofDay(context: context);
    setState(() {

    });
  }
  void NavigateToDetailScreen() {
    Navigator.pushNamed(context, ProductDetailsScreen.routeName,arguments: product);
  }
  @override
  Widget build(BuildContext context) {
    return product==null?const Loader():
    product!.name.isEmpty ? const SizedBox():
    GestureDetector(
      onTap: NavigateToDetailScreen,
      child: Column(
        children: [
          Container(
            alignment:
                Alignment.topLeft, // alignment container er vitore kaj kore
            padding: const EdgeInsets.only(left: 10, top: 15),
            child: const Text(
              'Deal of the day',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Image.network(
            product!.images[0],
            height: 235,
            fit: BoxFit.fitHeight,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15),
            alignment: Alignment.topLeft,
            child: const Text(
              '\$100',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
            child: const Text(
              'Jakaria',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: product!.images.map((e) => Padding(
                padding: const EdgeInsets.only(right: 7),
                child: Image.network(
                    e,
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100),
              )).toList(),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15).copyWith(left: 15),
            alignment: Alignment.topLeft,
            child: Text('See all deals',style: TextStyle(
              color: Colors.cyan.shade800
            ),),
          )
        ],
      ),
    );
  }
}
