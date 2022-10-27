import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/widgets.dart';

class CardPage extends StatelessWidget {
   
  const CardPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Card Page'),
        elevation: 10,
      ),
      drawer: const DrawerMenu(),
      body: ListView(        
        padding: const EdgeInsets.symmetric(
          horizontal: 10,   
          vertical: 5        
        ),
        children: const[
          CardBasic(),          
          CardImage(),
          CardImage(),
          CardImage(),
          CardImage(),
          CardImage(),
          CardImage(),
          CardImage(),
        ],
      ),
    );
  }
}