import 'package:flutter/material.dart';
import 'package:psychonauts/screens/initview.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'FamiAhorros App',
      home: InitView(),
    );
  }
}