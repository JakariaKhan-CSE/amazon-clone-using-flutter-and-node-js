import 'package:amazon_clone/common/widget/bottom_bar.dart';
import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/features/admin/screen/admin_screen.dart';
import 'package:amazon_clone/features/auth/screen/auth_screen.dart';

import 'package:amazon_clone/provider/user_provider.dart';
import 'package:amazon_clone/router.dart';
import 'package:amazon_clone/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider(),)
  ],child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    authService.getUserData(context); // app run hoyar sathe sathe user er data load hobe
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Amazone clone',
        darkTheme: ThemeData.light(),
        theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables
              .backgroundColor, // all new scaffold er background color aita hobe
          // colorScheme: ColorScheme.light(
          //   // aikhane dark dile instead of light. sob kisur background black hobe
          //   primary: GlobalVariables
          //       .secondaryColor, // sob kisur(button) foreground color aita hobe
          // ),
          appBarTheme: AppBarTheme(
              elevation:
                  0, // sob app ber er theme 0 hobe and icon color black hobe
              iconTheme: IconThemeData(color: Colors.black)),

          useMaterial3: true,
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        // Now user already login thakle directly homescreen a niye jabe

        home:Provider.of<UserProvider>(context).user.token.isNotEmpty ? // token empty hole direct auth screen jabe. empty na hole type check kore dkhbe user hole userscreen na hole admin screen
        ( Provider.of<UserProvider>(context).user.type == 'user'? const BottomBar() : AdminScreen())
            :const AuthScreen()
    );
  }
}
