import 'package:amazon_clone/common/widget/loader.dart';
import 'package:amazon_clone/features/home/services/home_services.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variable.dart';
import '../../../model/products.dart';
import '../../products_details/screen/product_details_screen.dart';

class CategoryDealScreen extends StatefulWidget {
  static const String routeName = '/category-deals';
  final String category;
  const CategoryDealScreen({super.key, required this.category});

  @override
  State<CategoryDealScreen> createState() => _CategoryDealScreenState();
}

class _CategoryDealScreenState extends State<CategoryDealScreen> {
  List<Product>? Categoryproducts;
  final HomeServices homeServices = HomeServices();
  @override
  void initState() {
   fetchCategoryProducts();
    super.initState();
  }
  void fetchCategoryProducts()async{
   Categoryproducts = await homeServices.fetchCategoryProduct(context: context, category: widget.category);
   setState(() {
     // rebuild na korle all time loading hote  thakbe
   });
  }
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
          title: Text(widget.category,style: const TextStyle(color: Colors.black),)

        ),

      ),
      body: Categoryproducts==null ? const Loader() : Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            alignment: Alignment.topLeft,
            child: Text('Keep Shopping for ${widget.category}',style: const TextStyle(
              color: Colors.black, fontSize: 20
            ),),
          ),
          SizedBox(height: 170,
            child: GridView.builder(itemCount: Categoryproducts?.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,childAspectRatio: 1.4,mainAxisSpacing: 10
            ), itemBuilder: (context, index) {
              final product = Categoryproducts?[index];
      return GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, ProductDetailsScreen.routeName, arguments: product);
        },
        child: Column(
          children: [
           SizedBox(height: 130,
           child: DecoratedBox(
       decoration: BoxDecoration(
         border: Border.all(color: Colors.black38,width: 0.5),

       ),
       child: Padding(
         padding: const EdgeInsets.all(10),
         child: Image.network(product!.images[0]),
       ),
           ),),
      Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(left: 5,top: 5,right: 15),
        child: Text(product.name,maxLines: 1,overflow: TextOverflow.ellipsis,),
      )
          ],
        ),
      );
            },),)
        ],
      ),
    );
  }
}
