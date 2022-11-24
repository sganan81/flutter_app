import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/drawer_menu.dart';
import 'package:provider/provider.dart';

class DemoProvider extends StatelessWidget {
   
  const DemoProvider({super.key});

  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (context) => _handlerPage(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Demo Provider'),
          centerTitle: false,
          toolbarHeight: 80,
          elevation: 10,        
        ),
        drawer: DrawerMenu(),
        body: const Center(
           child: Text('Demo Provider'),
        ),         
        bottomNavigationBar: const ControlNavigation()
      ),
    );
  }
}


class ControlNavigation extends StatelessWidget {


  const ControlNavigation({super.key});

  

  @override
  Widget build(BuildContext context) {

    final botonera = Provider.of<_handlerPage>(context);

    return BottomNavigationBar(
        currentIndex: botonera.botonActual ,
        onTap: (value) {
          botonera.botonActual = value;          
        },
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        enableFeedback: false,
        elevation: 10,
        items: const [
          BottomNavigationBarItem(
            label: 'Button 1',
            icon: Icon(Icons.abc)            
          ),
          BottomNavigationBarItem(
            label: 'Button 2',
            icon: Icon(Icons.abc)
          ),
          BottomNavigationBarItem(
            label: 'Button 3',
            icon: Icon(Icons.abc)
          ),
        ]
      );
  }
}

class _handlerPage extends ChangeNotifier{
 int _botonActual = 0;

 int get botonActual => _botonActual;

 set botonActual(int value){
  _botonActual = value;
  notifyListeners();  
 }

}

