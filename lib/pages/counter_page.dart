import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/widgets.dart';

class CounterPage extends StatefulWidget {


  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterStatePage();
}

class _CounterStatePage extends State<CounterPage> {
  int _counter = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Counter App'),
        elevation: 10,
      ),
      drawer: const DrawerMenu(),
      body: Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,           
           children: [
              const Text( 
                    'Usted ha realizado los siguientes clicks:', 
                    style: TextStyle(
                        fontSize: 18.5,
                        fontWeight: FontWeight.bold
                      ),
                  ),
              Text('Cantidad de clicks: $_counter', style: const TextStyle(fontSize: 21),),              
          ],
        ),
      ),   
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,   
      floatingActionButton: Container(                
        width: 330, 
        decoration: BoxDecoration(
          color: Colors.green.shade50,
          borderRadius: BorderRadius.circular(15),          
        ),            
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,        
          children: [
            FloatingActionButton(
              heroTag: 'fab_minus',
              onPressed: () {                 
                setState(() {
                  _counter--;                  
                });
              },
              child: const Icon(Icons.exposure_minus_1),
      
            ),
            FloatingActionButton(
              heroTag: 'fab_reset',
              onPressed: () { 
                setState(() {
                  _counter = 0;                  
                });
              },
              child: const Icon(Icons.restore),
      
            ),
            FloatingActionButton(
              heroTag: 'fab_plus',
              onPressed: () { 
                setState(() {
                  _counter++;                  
                });
              },
              child: const Icon(Icons.plus_one_outlined),
      
            ),
          ],
        ),
      ),
    );
  }
}