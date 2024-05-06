import 'package:amazon_clone/features/admin/screen/add_product_screen.dart';
import 'package:amazon_clone/features/auth/screen/auth_screen.dart';
import 'package:amazon_clone/features/home/screen/category_deals_screen.dart';
import 'package:amazon_clone/features/home/screen/home_screen.dart';
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
          builder: (_) => AuthScreen(),);
      }
    case HomeScreen.routeName:
      {
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => HomeScreen(),);
      }
    case BottomBar.routeName:
      {
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => BottomBar(),);
      }
    case AddProductScreen.routeName:
      {
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => AddProductScreen(),);
      }
    case CategoryDealScreen.routeName:
      {
        var category = routeSettings.arguments as String;
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => CategoryDealScreen(category: category),);
      }


    default:
      {
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(child: Text('Screen does not exist'),),
        ),);
      }
  }
}