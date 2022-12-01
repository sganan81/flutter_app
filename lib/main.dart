import 'package:flutter/material.dart';
import 'package:flutter_app/pages/clima_page.dart';
import 'package:flutter_app/pages/pages.dart';
import 'package:flutter_app/providers/providers.dart';
import 'package:flutter_app/shared/preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Preferences.init();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );  //valores guardados en el disco de nuestro movil.  

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (context) => ThemeProvider(isDarkMode: Preferences.darkmode) ),
      ],
      child: const MyApp(),
    )    
  );
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  
 
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'MyApp',      
      debugShowCheckedModeBanner: false,
      theme:  Provider.of<ThemeProvider>(context).temaActual,      
      initialRoute: 'login',
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
        'demo_provider':(context) => const DemoProvider(),  
        'photo_provider':(context) => const PhotosPage(),  
        'clima_provider':(context) => const ClimaPage(),  
        'login':(context) => const LoginPage(),  
        'register':(context) => const RegisterPage(),  
        'future_builder':(context) => FutureBuilderPage(),  
              
      },
    );    
  }  

}