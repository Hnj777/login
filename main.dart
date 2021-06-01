import 'package:flutter/material.dart';
import 'package:shopapi/view/login.dart';
import 'package:shopapi/view/register.dart';
import './view/homepage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ShopApi",
      home: MyHomePage(),
      routes: {"Register": (BuildContext context) => Register()},
    );
  }
}
