import 'package:flutter/material.dart';
import 'package:waste/loding.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Diabetic Retinopathy Detection',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     
      home: LoadingScreen(),
    );
  }
}

