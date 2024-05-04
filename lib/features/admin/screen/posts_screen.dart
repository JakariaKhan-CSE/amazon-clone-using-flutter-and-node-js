import 'package:amazon_clone/features/admin/screen/add_product_screen.dart';
import 'package:flutter/material.dart';

class PostScreens extends StatefulWidget {
  const PostScreens({super.key});

  @override
  State<PostScreens> createState() => _PostScreensState();
}

class _PostScreensState extends State<PostScreens> {
  void navigateToAddProduct()
  {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Products'),),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add a Product',
        backgroundColor: Colors.teal,
        shape: CircleBorder(),
        onPressed: navigateToAddProduct,child: Icon(Icons.add),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
