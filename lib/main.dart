import 'package:flutter/material.dart';
import 'package:flutter_application_4/page_counter.dart';
import 'package:flutter_application_4/page_demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      home: DemoScreen(),
      debugShowCheckedModeBanner: false,      
    );    
  }  

}