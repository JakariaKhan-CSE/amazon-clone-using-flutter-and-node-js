import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/features/account/widget/below_app_bar.dart';
import 'package:amazon_clone/features/account/widget/orders.dart';
import 'package:amazon_clone/features/account/widget/top_button.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        // default appbar na niye  aita neyar karon hosse appbar er height issa moto korbo
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topRight,
                child: Image.asset(
                  'assets/images/amazon_in.png',
                  width: 120,
                  height: 45,
                  color: Colors.black,
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Icon(Icons.notification_add_outlined),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(Icons.search),
                  ),
                ],
              )
            ],
          ),

        ),

      ),
      body: const Column(
        children: [
          BelowAppBar(),
          SizedBox(height: 10,),
          TopButton(),
          SizedBox(height: 20,),
          Orders(),
        ],
      ),
    );
  }
}
