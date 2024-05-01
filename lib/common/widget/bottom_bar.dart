import 'package:amazon_clone/constants/global_variable.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: _page,
      selectedItemColor: GlobalVariables.selectedNavBarColor,
      unselectedItemColor: GlobalVariables.unselectedNavBarColor,
      backgroundColor: GlobalVariables.backgroundColor,
      iconSize: 28,
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
          child: Icon(Icons.account_circle),

        ),label: ''),
      ],
    ),
    );
  }
}
