import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/features/account/screen/account_screen.dart';
import 'package:amazon_clone/features/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;  // very important
class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';  // const na dile error ashbe
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarwidth = 42;
  double bottomBarBorderwidth = 5;
  void updatePage(int page)
  {
    setState(() {
      _page = page;
    });
  }
  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(child: Text('Cart page'),),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: _page,
      selectedItemColor: GlobalVariables.selectedNavBarColor,
      unselectedItemColor: GlobalVariables.unselectedNavBarColor,
      backgroundColor: GlobalVariables.backgroundColor,
      iconSize: 28,
      onTap: updatePage,  // (val){updatePage(val)}. this is write short type
      items: [
BottomNavigationBarItem(icon: Container(
  width: bottomBarwidth,
  decoration: BoxDecoration(
    border: Border(top: BorderSide(
      color: _page==0 ? GlobalVariables.selectedNavBarColor: GlobalVariables.backgroundColor
          ,width: bottomBarBorderwidth
    ))
  ),
  child: Icon(Icons.home_outlined),

),label: ''),
        BottomNavigationBarItem(icon: Container(
          width: bottomBarwidth,
          decoration: BoxDecoration(
              border: Border(top: BorderSide(
                  color: _page==1 ? GlobalVariables.selectedNavBarColor: GlobalVariables.backgroundColor
                  ,width: bottomBarBorderwidth
              ))
          ),
          child: Icon(Icons.person_outline_outlined),

        ),label: ''),
        BottomNavigationBarItem(icon: Container(
          width: bottomBarwidth,
          decoration: BoxDecoration(
              border: Border(top: BorderSide(
                  color: _page==2 ? GlobalVariables.selectedNavBarColor: GlobalVariables.backgroundColor
                  ,width: bottomBarBorderwidth
              ))
          ),
            
              child: badges.Badge(
                  badgeContent: Text('3'),
badgeStyle: badges.BadgeStyle(
  elevation: 0,
  badgeColor: Colors.white,
),
                  child: Icon(Icons.add_shopping_cart_outlined))),

        label: ''),
      ],
    ),
    );
  }
}
