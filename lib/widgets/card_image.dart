import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  const CardImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        clipBehavior: Clip.antiAlias,      
        shadowColor: Colors.green.withOpacity(0.7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        elevation: 10,
        child: Column(children: [
          const FadeInImage(
            placeholder: AssetImage('assets/images/loading.gif'), 
            image: NetworkImage('https://images.unsplash.com/photo-1505159940484-eb2b9f2588e2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
            fit: BoxFit.cover,
            width: double.infinity,
            height: 250,
            fadeInDuration: Duration(milliseconds: 600),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.bottomLeft,
            child: const Text(
              'Creditos: image con un texto que supera las 2 lineas',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ]),
      ),
    );
  }
}