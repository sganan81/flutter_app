import 'package:flutter/material.dart';
import 'package:flutter_app/providers/providers.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class PhotosPage extends StatelessWidget {
   
  const PhotosPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      lazy: false,
      create: (BuildContext context) => PhotosProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Photo Unsplash'),
        ),
        drawer: DrawerMenu(),
        body: const Center(
           child: ListaImagenes(),
        ),
      ),
    );
  }
}

class ListaImagenes extends StatelessWidget {
  const ListaImagenes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listaFotos  = Provider.of<PhotosProvider>(context);
    

    return ListView.builder(
      itemCount: listaFotos.photos.length,
      itemBuilder: (context, index) {
        //listaFotos.photos[index].urls.small
        return FadeInImage(
          placeholder: AssetImage('assets/images/loading.gif'), 
          image: NetworkImage(listaFotos.photos[index].urls.small)
        );
      },
    );
  }
}