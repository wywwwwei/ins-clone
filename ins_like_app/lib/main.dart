import 'package:ins_like_app/page/home_screen.dart';
import 'package:ins_like_app/page/login.dart';
import 'package:flutter/material.dart';
import 'package:ins_like_app/page/feed_home.dart';
import 'package:ins_like_app/page/feed_image.dart';
import 'package:ins_like_app/page/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Share',
      theme: ThemeData(
        // This is the theme of your application.

        primarySwatch: Colors.blue,
        primaryColor:Colors.white,
        primaryIconTheme: IconThemeData(color: Colors.black),

      ),
      // Start the app with the "/" named route.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the Home widget.
        '/':(context)=>LoginPage(),
        SignUpPage.routeName:(context) => SignUpPage(),
        HomeScreen.routeName:(context) => HomeScreen(),
        HomePage.routeName:(context) => HomePage(),
        ImageDetail.routeName:(context) => ImageDetail(),
      },
    );
  }
}
