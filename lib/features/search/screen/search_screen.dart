import 'package:amazon_clone/common/widget/loader.dart';
import 'package:amazon_clone/features/search/services/search_services.dart';
import 'package:flutter/material.dart';

import '../../../model/products.dart';

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
  @override
  Widget build(BuildContext context) {
    return products == null ?const Loader()  :Scaffold(
      body: Center(child: Text(widget.searchQuery),),
    );
  }
}
