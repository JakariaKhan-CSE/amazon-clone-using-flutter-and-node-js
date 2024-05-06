import 'package:amazon_clone/common/widget/loader.dart';
import 'package:amazon_clone/features/admin/screen/add_product_screen.dart';
import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:amazon_clone/model/products.dart';
import 'package:flutter/material.dart';

class PostScreens extends StatefulWidget {
  const PostScreens({super.key});

  @override
  State<PostScreens> createState() => _PostScreensState();
}

class _PostScreensState extends State<PostScreens> {
  List<Product>? products;  // nullable kora hoyese jate loading ta show kore
  AdminServices adminServices = AdminServices();

  void navigateToAddProduct()
  {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }
  @override
  void initState() {  // initState asyn support kore na tai alada function create korte hobe
    fetchAllProduct();
    super.initState();
  }
  fetchAllProduct()async{
   products =  await adminServices.fetchAllProduct(context);
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return products == null? const Loader()  : Scaffold(
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
