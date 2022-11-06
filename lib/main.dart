import 'package:flutter/material.dart';
import 'package:flutter_app/pages/pages.dart';
import 'package:flutter_app/themes/default_theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  
  final bool _lightTheme = true;
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',      
      debugShowCheckedModeBanner: false,
      theme: (_lightTheme) ? DefaultTheme.defaultTheme: DefaultTheme.darkTheme ,      
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomePage(),
        'design': (context) => const DesignPage(),
        'listview': (context) => const ListViewPage(),
        'listviewbuilder': (context) => const ListBuilderPage(),
        'demo': (context) => const DemoPage(),
        'counter': (context) => const CounterPage(),
        'container': (context) => const ContainerPage(),
        'card': (context) => const CardPage(),
        'qr_scanner':(context) => const QrScannerPage(),
        'custom_list':(context) => CustomListPage(),
        'card_swiper':(context) => const CardSwiperPage(),
      },
    );    
  }  

}