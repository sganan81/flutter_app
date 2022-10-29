import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class DemoPage extends StatelessWidget {
   
  const DemoPage({super.key});
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(     
      appBar: AppBar(
        title: const Text('Demo Page'),
      ),
      drawer: DrawerMenu(),
      body: SingleChildScrollView(
        child: Center(
           child: Column(
              children: [                
                  FadeInImage(
                      placeholder: const AssetImage('assets/loading.gif'), 
                      image: const NetworkImage('https://i.blogs.es/1aad84/marvel/1366_521.jpeg'),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: size.height * 0.35,
                  ),
                  Container(
                    color: Colors.black12,
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(20),
                    height: size.height * 0.12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const[
                              Text('Titulo de prueba principal', style: TextStyle(fontWeight: FontWeight.bold )),
                              SizedBox(height: 5),
                              Text('Subtítulo de prueba'),
                            ],
                          ),
                        ),
                        const Icon(Icons.star_outline),
                        const Text('50')
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black12,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: const[
                            Icon(Icons.phone),
                            SizedBox(height: 5),
                            Text('CALL'),
                          ],
                        ),
                        Column(
                          children: const[
                            Icon(Icons.telegram),
                            SizedBox(height: 5),
                            Text('ROUTE'),
                          ],
                        ),
                        Column(
                          children: const[
                            Icon(Icons.share),
                            SizedBox(height: 5),
                            Text('SHARE'),
                          ],
                        ),
      
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: const Text('Non nisi sint nostrud laborum cillum ut labore veniam. Laboris ullamco dolor fugiat deserunt cupidatat ipsum sit amet in elit consectetur magna aliquip consectetur. Quis velit do in ea commodo tempor tempor mollit. Non in labore enim consectetur nulla incididunt nisi quis laborum do nostrud nostrud. Amet commodo mollit magna incididunt incididunt reprehenderit non. Reprehenderit esse quis nisi minim consectetur qui eu pariatur proident sint. Sint commodo sit aute duis enim culpa ad cupidatat in.')
                    )
              ]
            ),
        ),
      ),
    );
  }
}