import 'package:flutter/material.dart';
import 'package:my_first_app/pages/splash_page.dart';
import 'package:my_first_app/pages/first_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Name",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "splash",
      routes:{
        "splash": (context) => SplashScreen(),
        "first": (context) => FirstPage(),
      }
    );
  }
}
