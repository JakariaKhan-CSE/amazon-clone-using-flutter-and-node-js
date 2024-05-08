import 'package:amazon_clone/common/widget/loader.dart';
import 'package:amazon_clone/features/search/services/search_services.dart';
import 'package:amazon_clone/features/search/widget/search_product.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variable.dart';
import '../../../model/products.dart';
import '../../home/widget/address_box.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search-screen';
  final String searchQuery;
  const SearchScreen({super.key, required this.searchQuery});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? products;
  final SearchServices searchServices = SearchServices();
  @override
  void initState() {
    fetchSearchProduct();
    super.initState();
  }
  void fetchSearchProduct()async{
    products = await searchServices.fetchSearchProduct(context: context, searchQuery: widget.searchQuery);
    setState(() {

    });
  }
  void navigateToSearchScreen(String query)
  {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        // default appbar na niye  aita neyar karon hosse appbar er height issa moto korbo
        preferredSize: const Size.fromHeight(60), // aitar size joto dibo appbar er size totp hobe
        child: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },icon: const Icon(Icons.arrow_back_ios),),
          flexibleSpace: Container(
            decoration: const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen, // very important onFieldSubmitted
                      decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: (){

                            },
                            child: const Padding(
                              padding: EdgeInsets.only(left: 6),
                              child: Icon(Icons.search,color: Colors.black,size: 23,),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(top: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide.none
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: const BorderSide(color: Colors.black38,width: 1)
                          ),
                          hintText: 'Search Amazon.in',
                          hintStyle: const TextStyle(
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
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(Icons.mic,color: Colors.black,size: 25,),
              )

            ],
          ),

        ),

      ),
      body: products == null ?const Loader()  : Column(
        children: [
          const AddressBox(),
          const SizedBox(height: 10,),
          Expanded(  // listview builder er size na bole dile eror dei. ai karone expanded deya hoyese jate tar issa moto space nei
              child: ListView.builder(
                itemCount: products?.length,
                itemBuilder: (context, index) {
                  final Product product = products![index];
                  // one letter diyeo search kora jabe
return SearchProduct(product: product);
              },))
        ],
      ),
     
      );

  }
}
