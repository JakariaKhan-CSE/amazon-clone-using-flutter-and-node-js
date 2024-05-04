import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variable.dart';
import '../../../provider/user_provider.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: PreferredSize(
        // default appbar na niye  aita neyar karon hosse appbar er height issa moto korbo
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // alignment: Alignment.topRight,
                child: Image.asset(
                  'assets/images/amazon_in.png',
                  width: 120,
                  height: 45,
                  color: Colors.black,
                ),
              ),
              Container(
                child: Text(user.type,style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,fontWeight: FontWeight.bold
                ),),
              )
            ],
          ),
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },icon: Icon(Icons.arrow_back_ios,size: 22,),),

        ),

      ),
    );
  }
}
