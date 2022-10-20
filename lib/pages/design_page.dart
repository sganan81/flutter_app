import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class DesignPage extends StatelessWidget {
   
  const DesignPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: const Text('Diseño Page'),
      ),
      drawer: const DrawerMenu(),   
      body: SafeArea(
        top: false,
        child: Center(
          child: ListView(           
             children: [             
                 const FadeInImage(
                    image: NetworkImage('https://www.eltiempo.com/files/article_main/uploads/2022/06/04/629bff00a3ab6.jpeg'),
                    placeholder: AssetImage('assets/images/loading.gif'),
                    fit:BoxFit.cover,
                    height: 250,
                  ), 
                  Container(
                    color: Colors.black12,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),                  
                    child: Row(                    
                      children: [                    
                        Expanded(
                          child: Column(                            
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const[
                              Text('Título principal de la fila', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19)),
                              SizedBox(height: 5),
                              Text('Subtítulo de la fila', style: TextStyle(fontSize: 17)),
                            ],
                          ),
                        ),
                        const Icon(Icons.star),
                        const Text('41')
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top:20),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    color: Colors.black12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: const [
                            Icon(Icons.phone),
                            SizedBox(height: 10),
                            Text('CALL', style:TextStyle(fontSize: 16)),
                          ],
                        ),
                        Column(
                          children: const [
                            Icon(Icons.telegram_rounded),
                            SizedBox(height: 10),
                            Text('ROUTE', style:TextStyle(fontSize: 16)),
                          ],
                        ),
                        Column(
                          children: const [
                            Icon(Icons.share),
                            SizedBox(height: 10),
                            Text('SHARE', style:TextStyle(fontSize: 16)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black12,
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: const Text(
                      'Cillum velit irure sunt Lorem reprehenderit eu nisi sunt laborum. Velit esse id ex tempor esse labore anim aute culpa do non non excepteur sint. Dolor ea tempor culpa aliquip quis reprehenderit commodo aute elit do enim enim incididunt. Voluptate in fugiat consectetur adipisicing qui aliqua cillum ea tempor excepteur ea tempor ex. Consectetur do cupidatat laborum deserunt Lorem incididunt aliquip est exercitation officia dolor id consequat ipsum. Non ex ex incididunt eiusmod enim deserunt nostrud ut.',
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.justify,
                    )
                  )      
              ],
          ),
        ),
      ),
    );
  }
}