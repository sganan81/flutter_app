import 'package:flutter/material.dart';
import 'package:flutter_app/pages/login_page.dart';
import 'package:flutter_app/services/auth_service.dart';
import 'package:flutter_app/themes/default_theme.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const LoginPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.5, 1.0);
      const end = Offset.zero;
      const curve = Curves.linear;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthFirebaseService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        elevation: 10.0,                
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                authService.logout();
                Navigator.of(context).push(_createRoute());
              },              
              child: const Icon(Icons.logout)
            ),
          ),
        ],        
      ),
      drawer: DrawerMenu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,          
          children: const[
            Text('Home de nuestra aplicación:',
                  style: TextStyle(
                    fontSize: 20, 
                    color: DefaultTheme.primary
                  )
                ),
            SizedBox(height: 5),
            Text('Recuerde ver el menu hamburguesa para recorrer las diferentes pantallas:', 
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
          ],
        ),
      ),      
    );
  }
}