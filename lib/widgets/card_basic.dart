import 'package:flutter/material.dart';

class CardBasic extends StatelessWidget {
  const CardBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(            
        elevation: 10,
        child: Column(
          children: [
            const ListTile(
              leading: Icon(Icons.image),
              title: Text(
                'Título de nuestra Card con texto en overflow.',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontFamily: 'FuzzyBubbles'),
              )
              ,
              subtitle: Text(
                  'Ea consectetur ex fugiat id commodo sit sint dolore minim ut aute. Et veniam excepteur duis nisi eu sint do. Et veniam excepteur duis nisi eu sint do. Ea consectetur ex fugiat id commodo sit sint dolore minim ut aute. Et veniam excepteur duis nisi eu sint do.',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'FuzzyBubbles'
                  ),
                  maxLines: 8,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                ),
              minVerticalPadding: 15,
              minLeadingWidth: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                    TextButton(
                      onPressed: () {
                        
                      }, 
                      child: const Text('Cancelar')
                    ),
                    const SizedBox( width: 5),
                    ElevatedButton(
                      onPressed: () {
                        
                      },
                      child: const Text('Aceptar')
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}