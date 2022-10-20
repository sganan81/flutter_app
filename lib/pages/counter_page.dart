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
      floatingActionButton: Container(
        color: Colors.black12,
        padding: const EdgeInsets.symmetric(vertical: 20),
      
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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