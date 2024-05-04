import 'package:amazon_clone/features/admin/screen/posts_screen.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import '../../../constants/global_variable.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
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
    PostScreens(),
    const Center(child: Text('Analytics page'),),
    const Center(child: Text('Cart page'),),
  ];
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: PreferredSize(
        // default appbar na niye  aita neyar karon hosse appbar er height issa moto korbo
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // alignment: Alignment.topRight,
                child: Image.asset(
                  'assets/images/amazon_in.png',
                  width: 120,
                  height: 45,
                  color: Colors.black,
                ),
              ),
              Container(
                child: Text(user.type,style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,fontWeight: FontWeight.bold
                ),),
              )
            ],
          ),

        ),

      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,  // (val){updatePage(val)}. this is write short type
        items: [
          // POSTS
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
          // ANALYTICS
          BottomNavigationBarItem(icon: Container(
            width: bottomBarwidth,
            decoration: BoxDecoration(
                border: Border(top: BorderSide(
                    color: _page==1 ? GlobalVariables.selectedNavBarColor: GlobalVariables.backgroundColor
                    ,width: bottomBarBorderwidth
                ))
            ),
            child: Icon(Icons.analytics_outlined),

          ),label: ''),
          // ORDERS
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
                  child: Icon(Icons.all_inbox_outlined))),

              label: ''),
        ],
      ),
    );
  }
}
