import 'package:dashboard_flutter/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


//import 'HomeScreen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch:Colors.blue,
      ),
        home:  const splashscreen(),
      //home: const MyHomePage(),
    );
  }
}

