import 'package:flutter/material.dart';
import 'package:flutter_app/pages/pages.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',      
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),      
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomePage(),
        'design': (context) => const DesignPage(),
        'listview': (context) => const ListViewPage(),
        'listviewbuilder': (context) => const ListBuilderPage(),
        'demo': (context) => const DemoPage(),
        'counter': (context) => const CounterPage(),
        'container': (context) => const ContainerPage(),
      },
    );    
  }  

}