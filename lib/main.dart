import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/features/auth/screen/auth_screen.dart';
import 'package:amazon_clone/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Amazone clone',
        theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables
              .backgroundColor, // all new scaffold er background color aita hobe
          colorScheme: ColorScheme.light(
            // aikhane dark dile instead of light. sob kisur background black hobe
            primary: GlobalVariables
                .secondaryColor, // sob kisur(button) foreground color aita hobe
          ),
          appBarTheme: AppBarTheme(
              elevation:
                  0, // sob app ber er theme 0 hobe and icon color black hobe
              iconTheme: IconThemeData(color: Colors.black)),

          useMaterial3: true,
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: AuthScreen()
    );
  }
}
