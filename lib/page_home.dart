import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App bar'),
        centerTitle: true,
        elevation: 10.0,
        backgroundColor: Colors.green,
        toolbarHeight: 40,
      ),
      body: const Center(child: Text('Body Scaffold')),
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          print('Hice click');
         },
        child:  const Icon(Icons.search)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}