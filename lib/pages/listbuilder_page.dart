import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class ListBuilderPage extends StatelessWidget {
   
  const ListBuilderPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Builder Page'),
      ),
      drawer: const DrawerMenu(),
      body: ListView.separated(
        itemBuilder: (_, index) {
         return const ListTile(
            title: Text('Texto de prueba'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_forward_rounded),
            subtitle: Text('help block'),
          );
        }, 
        separatorBuilder: (_, __) {
          return const Divider(height: 5);
        }, 
        itemCount: 100
    ),
    );
  }
}