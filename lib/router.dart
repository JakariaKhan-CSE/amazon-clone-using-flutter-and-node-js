import 'package:amazon_clone/features/admin/screen/add_product_screen.dart';
import 'package:amazon_clone/features/auth/screen/auth_screen.dart';
import 'package:amazon_clone/features/home/screen/category_deals_screen.dart';
import 'package:amazon_clone/features/home/screen/home_screen.dart';
import 'package:amazon_clone/features/products_details/screen/product_details_screen.dart';
import 'package:amazon_clone/features/search/screen/search_screen.dart';
import 'package:amazon_clone/model/products.dart';
import 'package:flutter/material.dart';

import 'common/widget/bottom_bar.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings)
{
  switch(routeSettings.name)
      {
    case AuthScreen.routeName:
      {
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const AuthScreen(),);
      }
    case HomeScreen.routeName:
      {
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const HomeScreen(),);
      }
    case BottomBar.routeName:
      {
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const BottomBar(),);
      }
    case AddProductScreen.routeName:
      {
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const AddProductScreen(),);
      }
    case CategoryDealScreen.routeName:
      {
        var category = routeSettings.arguments as String;
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => CategoryDealScreen(category: category),);
      }
    case SearchScreen.routeName:
      {
        var searchQuery = routeSettings.arguments as String;
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => SearchScreen(searchQuery: searchQuery,),);
      }
    case ProductDetailsScreen.routeName:
      {
        var product = routeSettings.arguments as Product;
        return MaterialPageRoute(settings: routeSettings,builder: (context) => ProductDetailsScreen(product: product),);
      }


    default:
      {
        return MaterialPageRoute(builder: (_) => const Scaffold(
          body: Center(child: Text('Screen does not exist'),),
        ),);
      }
  }
}