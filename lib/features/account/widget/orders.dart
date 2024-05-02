import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/features/account/widget/single_product.dart';
import 'package:flutter/cupertino.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  // temporary list
  List list =[
    'https://plus.unsplash.com/premium_photo-1670333183141-9e3ffc533dfa?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHx8',
    'https://images.unsplash.com/photo-1713365963723-655fa464b681?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3fHx8ZW58MHx8fHx8',
    'https://images.unsplash.com/photo-1714591938366-e3f181e0e0be?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyOXx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1714496092418-66838cb18023?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1OXx8fGVufDB8fHx8fA%3D%3D'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Container(
      padding: EdgeInsets.only(left: 15),
      child: Text('Your Orders',style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600
      ),),
    ),
    Container(
      padding: EdgeInsets.only(right: 15),
      child: Text('See all',style: TextStyle(
        color: GlobalVariables.selectedNavBarColor
      ),),
    ),
  ],
),
        // display orders
        Container(
          height: 170,  // listview builder use kora hobe height na dile render overflow error dibe
          padding: EdgeInsets.only(left: 10,top: 20,right: 0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
            return SingleProduct(image: list[index]);
          },),
        )
      ],
    );
  }
}
