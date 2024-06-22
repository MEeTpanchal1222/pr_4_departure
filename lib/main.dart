import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:pr_4_departure/provider/provider.dart';
import 'package:pr_4_departure/uitels/theme.dart';
import 'package:pr_4_departure/view/detail_screen/detail_scren.dart';
import 'package:pr_4_departure/view/home_screen/home_scren.dart';
import 'package:pr_4_departure/view/slash_screen/slash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Dataprovider()),
      ],
      child:  MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: GlobalTheme.lighttheme,
      //darkTheme: GlobalTheme.darktheme,
      routes: {
        "/":(context) => SplashScreen(),
        "/home": (context) => HomeScren(),
      },
    );
  }
}



