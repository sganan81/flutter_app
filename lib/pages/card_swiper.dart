import 'package:flutter/material.dart';

class CardSwiperPage extends StatelessWidget {
   
  const CardSwiperPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const CardPoster(),
            const CardBody(),
            const SizedBox(height: 10,),            
            CardSwiper(),
          ],
        ),
      ),
    );
  }
}

class CardBody extends StatelessWidget {
  const CardBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(      
      width: double.infinity,
      height: 140,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [            
            Text('Game of Thrones',style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 28
            ),),
            SizedBox(height: 5,),
            Text(
              maxLines:5,
              textAlign:TextAlign.justify,
              'Enim non culpa amet sint cillum dolor culpa irure mollit sit minim sit eiusmod ad. Elit anim adipisicing voluptate exercitation consectetur aliquip exercitation reprehenderit ex elit tempor ipsum ut. Nulla reprehenderit incididunt mollit mollit ea consectetur.',
              style: TextStyle(                
                overflow: TextOverflow.ellipsis,                
              ),
            )
          ],
        )
    );
  }
}

class CardSwiper extends StatelessWidget {

  final List _cast_movies = <Map<String,String>>[
    {'image':'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/86jeYFV40KctQMDQIWhJ5oviNGj.jpg','actor':'Emilia Clarke','name':'Daenerys Targaryen','duration':'80 episodios'},
    {'image':'https://www.themoviedb.org/t/p/w138_and_h175_face/htGBMno71BJAEGF3Y9f62MdA3Yt.jpg','actor':'Kit Harington','name':'Jon Snow','duration':'80 episodios'},
    {'image':'https://www.themoviedb.org/t/p/w138_and_h175_face/lRsRgnksAhBRXwAB68MFjmTtLrk.jpg','actor':'Peter Dinklage','name':'Tyrion Lannister','duration':'79 episodios'},
    {'image':'https://www.themoviedb.org/t/p/w138_and_h175_face/n9zXQhjtXQnc30kqF66hdX4i3PG.jpg','actor':'Iain Glen','name':'Jorah Mormont','duration':'79 episodios'},
    {'image':'https://www.themoviedb.org/t/p/w138_and_h175_face/5SL4Y4alOYF9EahObfsb6GaDHg4.jpg','actor':'Lena Headey','name':'Cersei Lannister','duration':'77 episodios'},
    {'image':'https://www.themoviedb.org/t/p/w138_and_h175_face/zopxZsUZmxZ4sGEfm4cRr7FVoM4.jpg','actor':'Sophie Turner','name':'Sansa Stark','duration':'76 episodios'},
    {'image':'https://www.themoviedb.org/t/p/w138_and_h175_face/puWXJbe5ZGnOqJhVr9lEgstvygy.jpg','actor':'Maisie Williams','name':'Arya Stark','duration':'75 episodios'},
    {'image':'https://www.themoviedb.org/t/p/w138_and_h175_face/7gPpG0TBMX20tPhWC8BT47x2lnh.jpg','actor':'Alfie Allen','name':'Theon Greyjoy','duration':'74 episodios'},
    {'image':'https://www.themoviedb.org/t/p/w138_and_h175_face/zRc8eGN3aFjDapoAKpzWBYBFxCr.jpg','actor':'Conleth Hill','name':'Lord Varys, Varys','duration':'72 episodios'},
  ];

  CardSwiper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 320,       
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,        
        children: [
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Cards inferior', 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,                
                color: Colors.black54
              ),
            ),
          ),
          Expanded(                 
            child: ListView.builder(                 
              shrinkWrap:true,
              scrollDirection: Axis.horizontal, 
              physics: const BouncingScrollPhysics(),              
              itemCount: _cast_movies.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Container(                  
                    width: 150,
                    height: 180,
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal:10),                  
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: FadeInImage(
                            placeholder: const AssetImage('assets/images/loading.gif'), 
                            image: NetworkImage(_cast_movies[index]['image']),
                            width: 140,
                            height: 160,
                            fit: BoxFit.cover,
                        
                          ),
                        ),
                        Text(_cast_movies[index]['actor'], 
                          style: TextStyle(fontSize: 17),
                        ),
                        const SizedBox(height: 5,),
                        Text(_cast_movies[index]['name']),
                        const SizedBox(height: 15,),
                        Text(_cast_movies[index]['duration']),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
      ],)
    );
  }
}

class CardPoster extends StatelessWidget {
  const CardPoster({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,      
      child: 
              const FadeInImage(
                placeholder: AssetImage('assets/images/loading.gif'), 
                image: NetworkImage('https://www.themoviedb.org/t/p/w600_and_h900_bestv2/z9gCSwIObDOD2BEtmUwfasar3xs.jpg'),                  
                fit: BoxFit.fill,
              
              ),
    );
  }
}