import 'package:flutter/material.dart';
import 'package:flutter_app/providers/providers.dart';
import 'package:flutter_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ClimaPage extends StatelessWidget {
   
  const ClimaPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      lazy: false,
      create: (BuildContext context) => ClimaProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Clima Open Weather Map'),
        ),
        drawer: DrawerMenu(),
        body: const Center(
           child: ListaClima(),
        ),
      ),
    );
  }
}

class ListaClima extends StatelessWidget {
  const ListaClima({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listaclima  = Provider.of<ClimaProvider>(context);
    
    if(!listaclima.loadData){
      return const Center(
        child:  SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
      );
    }

    return ListView.separated(
      itemCount: listaclima.clima.length,
      separatorBuilder: (context, index) => const Divider(height: 5,),
      itemBuilder: (context, index) {
        //listaclima.photos[index].urls.small
        return ListTile(      
          title: Text('Min: ${listaclima.clima[index].main.tempMin.toString()}  Max: ${listaclima.clima[index].main.tempMax.toString()}', style: const TextStyle(color: Colors.black),),
          subtitle: Text(listaclima.clima[index].dtTxt),
        );
      },
    );
  }
}