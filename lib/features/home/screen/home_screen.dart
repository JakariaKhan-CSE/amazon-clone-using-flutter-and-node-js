import 'package:amazon_clone/features/home/widget/address_box.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variable.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: PreferredSize(
        // default appbar na niye  aita neyar karon hosse appbar er height issa moto korbo
        preferredSize: Size.fromHeight(60), // aitar size joto dibo appbar er size totp hobe
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                    margin: EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: (){

                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Icon(Icons.search,color: Colors.black,size: 23,),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.only(top: 10),
                        border: OutlineInputBorder(
borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide.none
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(color: Colors.black38,width: 1)
                        ),
                        hintText: 'Search Amazon.in',
                        hintStyle: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600
                        )
                      ),

                    ),
                  ),
                
                ),
              ),
              Container(
                height: 42,
                color: Colors.transparent,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.mic,color: Colors.black,size: 25,),
              )

            ],
          ),

        ),

      ),
      body: Column(
        children: [
        AddressBox(),

        ],
      ),
    );
  }
}
