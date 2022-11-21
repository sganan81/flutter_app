import 'package:flutter/material.dart';
import 'package:flutter_app/pages/pages.dart';
import 'package:flutter_app/providers/theme_provider.dart';
import 'package:flutter_app/shared/preferences.dart';
import 'package:flutter_app/themes/default_theme.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();  //valores guardados en el disco de nuestro movil.

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (context) => ThemeProvider(isDarkMode: Preferences.darkmode) ),
      ],
      child: MyApp(),
    )    
  );
}

class MyApp extends StatelessWidget{
  MyApp({super.key});
  
 
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'MyApp',      
      debugShowCheckedModeBanner: false,
      theme:  Provider.of<ThemeProvider>(context).temaActual,      
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomePage(),
        'design': (context) => const DesignPage(),
        'listview': (context) => const ListViewPage(),
        'listviewbuilder': (context) => const ListBuilderPage(),
        'demo': (context) => const DemoPage(),
        'counter': (context) => const CounterPage(),
        'counter2': (context) => const CounterPage2(),
        'container': (context) => const ContainerPage(),
        'card': (context) => const CardPage(),
        'qr_scanner':(context) => const QrScannerPage(),
        'custom_list':(context) => const CustomListPage(),
        'card_swiper':(context) => const CardSwiperPage(),
        'form_page':(context) => const FormPage(),
        'pageview':(context) => PageViewPage(),
        'slivers':(context) => const SliversPage(),        
        'profile':(context) => const ProfilePage(),        
        'demo_provider':(context) => DemoProvider(),        
      },
    );    
  }  

}