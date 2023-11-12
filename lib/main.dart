import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dnc_test/page/root.dart';
import 'package:dnc_test/page/intro.dart';
import 'package:dnc_test/page/home/index.dart';
import 'package:dnc_test/page/auth/login/index.dart';
import 'package:dnc_test/page/auth/login/email.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => RootPage(),
          '/home': (context) => HomePage(),
          '/intro': (context) => IntroPage(),
          '/login': (context) => LoginIndex(),
          '/login/email': (context) => EmailLoginPage(),
        }
    );
  }
}

