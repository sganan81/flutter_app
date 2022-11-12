import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CustomListPage extends StatefulWidget {

  const CustomListPage({super.key});

  @override
  State<CustomListPage> createState() => _CustomListPageState();
}

class _CustomListPageState extends State<CustomListPage> {
  final List _elements = [
    ['avatar1','Juan Pablo','Ingeniero',42],
    ['avatar2','Juan Pablo','Ingeniero',23],
    ['avatar3','Juan Pablo','Ingeniero',44],
    ['avatar4','Juan Pablo','Ingeniero',2],
    ['avatar5','Juan Pablo','Ingeniero',2],
    ['avatar6','Juan Pablo','Ingeniero',1],
    ['avatar7','Juan Pablo','Ingeniero',4],
    ['avatar8','Juan Pablo','Ingeniero',4],
    ['avatar9','Juan Pablo','Ingeniero',52],
    ['avatar10','Juan Pablo','Ingeniero',6],
    ['avatar11','Juan Pablo','Ingeniero',7],
    ['avatar12','Juan Pablo','Ingeniero',21],
    ['avatar13','Juan Pablo','Ingeniero',9],
  ];
  double _opacityLevel = 0;

  final ScrollController _scrollController = ScrollController();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {

      _scrollController.addListener(() {
        print('pixel ${_scrollController.position.pixels} maxScrollExtent: ${_scrollController.position.maxScrollExtent}');
      });

      _opacityLevel = 1;
      setState(() {
        
      });
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom List'),
      ),
      drawer: DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedOpacity(
          opacity: _opacityLevel,
          duration: const Duration(milliseconds: 900),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            controller: _scrollController,
            itemCount: _elements.length,
            itemBuilder: (context, index) {
              return Container(            
                height: 90,
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),              
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        spreadRadius: 0,
                        offset: Offset(0, 6)
                      )
                    ]
                ),            
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Image.network('https://cdn-icons-png.flaticon.com/512/147/147133.png', width: 50, height: 50,),
                    GestureDetector(
                      child: Image.asset('assets/avatars/avatar${index + 1}.png', width: 50, height: 50,),
                      onTap: () {
                        print('tap $index');
                      },
                      onLongPress: () {
                        print('long press $index');
                      },
                    ),
                    const SizedBox(width: 15,),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_elements[index][1], style: TextStyle(
                              fontSize: 18,
                              color: Colors.blueAccent.shade200,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          Text(_elements[index][2], 
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star),
                        const SizedBox(width: 5,),
                        Text(_elements[index][3].toString())
                      ],
                    )
                  ]
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}