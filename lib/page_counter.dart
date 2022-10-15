import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {


  CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Counter App'),
        elevation: 10,
      ),
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
              Text('Cantidad de clicks: $_counter', style: TextStyle(fontSize: 21),),              
          ],
        ),
      ),
      floatingActionButton: Container(
        color: Colors.black12,
        padding: EdgeInsets.symmetric(vertical: 20),
      
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: () {                 
                setState(() {
                  _counter--;
                  print('-1: $_counter');
                });
              },
              child: Icon(Icons.exposure_minus_1),

            ),
            FloatingActionButton(
              onPressed: () { 
                setState(() {
                  _counter = 0;
                  print('reset: $_counter');
                });
              },
              child: Icon(Icons.restore),

            ),
            FloatingActionButton(
              onPressed: () { 
                setState(() {
                  _counter++;
                  print('+1: $_counter');                  
                });
              },
              child: Icon(Icons.plus_one_outlined),

            ),
          ],
        ),
      ),
    );
  }
}