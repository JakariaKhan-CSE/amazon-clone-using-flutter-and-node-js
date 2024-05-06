import 'package:amazon_clone/common/widget/loader.dart';
import 'package:amazon_clone/features/account/widget/single_product.dart';
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
// kisu na dileo notun kore rebuild kore
    });
  }

  void DeleteProduct(Product product, int index){
    adminServices.deleteProduct(context: context, product: product, onSuccess: (){
      products?.removeAt(index);  // frontend er list theke product delete kora hosse
      setState(() {
        // rebuild korbe
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return products == null? const Loader()  : Scaffold(

      body: GridView.builder(
        itemCount: products?.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),shrinkWrap: true, itemBuilder: (context, index) {
        final productData = products![index];  // can not be null, because null it already show loading indicator
        return Column(
          children: [
            SizedBox(
                height:130,
                child: SingleProduct(image: productData.images[0])),  // image array er first image dissi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Text(productData.name,overflow: TextOverflow.ellipsis,maxLines: 2,)),
                IconButton(onPressed: ()=>DeleteProduct(productData,index), icon: Icon(Icons.delete_outline,size: 22,))
              // sudhu aita DeleteProduct lekhleo hoto. auto niye nito
              ],
            )
          ],
        );
      },),





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
