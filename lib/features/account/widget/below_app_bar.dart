import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BelowAppBar extends StatefulWidget {
  const BelowAppBar({super.key});

  @override
  State<BelowAppBar> createState() => _BelowAppBarState();
}

class _BelowAppBarState extends State<BelowAppBar> {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user; // always use provider below of widget build(BuildContext context); upore dile conetxt error ashbe
    return Container(
      decoration: BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
      ),
      padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
      child: Row( // aikhane ro na dile sudhu left side jekhane text ase ooitar background color ashsilo bakita white
        children: [
          RichText(
            text: TextSpan(
              text: 'Hello, ',
              style: TextStyle(fontSize: 22, color: Colors.black),
              children: [
                TextSpan(
                text: user.name,
                style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.w600),),
              ]
            ),
          ),
        ],
      ),
    );
  }
}
