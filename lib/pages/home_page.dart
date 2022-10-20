import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        elevation: 10.0,                
      ),
      drawer: const DrawerMenu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,          
          children: const[
            Text('Home de nuestra aplicación:',style: TextStyle(fontSize: 20, color: Colors.green)),
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