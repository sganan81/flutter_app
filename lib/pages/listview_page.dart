import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class ListViewPage extends StatelessWidget {
   
  const ListViewPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
      ),
      drawer: DrawerMenu(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const ListTile(
            title: Text('Texto de prueba'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_forward_rounded),
            subtitle: Text('help block'),
          ),
          const ListTile(
            title: Text('Texto de prueba'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_forward_rounded),
            subtitle: Text('help block'),
          ),
          const ListTile(
            title: Text('Texto de prueba'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_forward_rounded),
            subtitle: Text('help block'),
          ),
          const ListTile(
            title: Text('Texto de prueba'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_forward_rounded),
            subtitle: Text('help block'),
          ),
          const ListTile(
            title: Text('Texto de prueba'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_forward_rounded),
            subtitle: Text('help block'),
          ),
          const ListTile(
            title: Text('Texto de prueba'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_forward_rounded),
            subtitle: Text('help block'),
          ),
          const ListTile(
            title: Text('Texto de prueba'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_forward_rounded),
            subtitle: Text('help block'),
          ),
          const ListTile(
            title: Text('Texto de prueba'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_forward_rounded),
            subtitle: Text('help block'),
          ),
          const ListTile(
            title: Text('Texto de prueba'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_forward_rounded),
            subtitle: Text('help block'),
          ),
          const ListTile(
            title: Text('Texto de prueba'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_forward_rounded),
            subtitle: Text('help block'),
          ),
          const ListTile(
            title: Text('Texto de prueba'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_forward_rounded),
            subtitle: Text('help block'),
          ),
          const ListTile(
            title: Text('Texto de prueba'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_forward_rounded),
            subtitle: Text('help block'),
          ),
          const ListTile(
            title: Text('Texto de prueba'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_forward_rounded),
            subtitle: Text('help block'),
          ),
          ListTile(
            title: const Text('Texto de prueba 99999'),
            leading: const Icon(Icons.check_box),
            trailing: const Icon(Icons.arrow_forward_rounded),
            subtitle: const Text('help block'),
            onTap: () => print('tap'),
            onLongPress: () => print('long tap'),
          ),
          const ListTile(
            title: Text('Texto de prueba'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_forward_rounded),
            subtitle: Text('help block'),
          ),
        ],
      ),
    );
  }
}