import 'package:bahas_movie/pages/home_page.dart';
import 'package:bahas_movie/pages/main_page.dart';
import 'package:bahas_movie/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/detail_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => MainPage(),
        '/login-page': (context) => LoginPage(),
        '/register-page': (context) => SignupPage(),
        '/detail-page': (context) => DetailPage()
      },
    );
  }
}
