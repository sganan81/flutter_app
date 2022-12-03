
import 'package:flutter/material.dart';
import 'package:flutter_app/themes/default_theme.dart';

class DrawerMenu extends StatelessWidget {
  final List<Map<String,String>> _menuItems = <Map<String,String>>[
    {'route':'home','title':'Homess','subtitle':'Home + counter app'},
    {'route':'counter','title':'Counter','subtitle':''},
    {'route':'counter2','title':'Counter Fx','subtitle':''},
    {'route':'design','title':'Diseño','subtitle':''},
    {'route':'listview','title':'ListView','subtitle':''},
    {'route':'listviewbuilder','title':'ListView Builder','subtitle':''},
    {'route':'container','title':'Animated Container','subtitle':''},
    {'route':'card','title':'Cards','subtitle':''},
    {'route':'qr_scanner','title':'QR Scanner','subtitle':''},
    {'route':'custom_list','title':'Custom List','subtitle':''},
    {'route':'card_swiper','title':'Swiper List','subtitle':''},
    {'route':'form_page','title':'Form inputs','subtitle':''},
    {'route':'slivers','title':'Slivers','subtitle':''},
    {'route':'pageview','title':'Pagevie','subtitle':''},
    {'route':'profile','title':'Profile','subtitle':'shared_prefrences'},
    {'route':'demo_provider','title':'Demo Provider','subtitle':''},
    {'route':'photo_provider','title':'Photo Provider','subtitle':'http,dotenv,quicktype'},
    {'route':'clima_provider','title':'Clima','subtitle':'http,dotenv,quicktype'},
    {'route':'future_builder','title':'Future Builder','subtitle':'unsplash'},

  ];

  DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(        
        padding: EdgeInsets.zero,        
        children: [
          const _DrawerHeaderAlternative(),          
          ...ListTile.divideTiles(
            context: context,
            tiles: _menuItems.map(
              (item) => ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 0, 
                      horizontal: 10
                    ),
                    dense: true,
                  minLeadingWidth: 25,                  
                  iconColor: Colors.blueGrey,
                  title: Text(item['title']!, style: const TextStyle(fontFamily: 'FuzzyBubbles')),
                  subtitle: Text(item['subtitle'] ?? '', style: const TextStyle(fontFamily: 'RobotoMono', fontSize: 11)),
                  leading: const Icon(Icons.arrow_right ),
                  onTap: () {
                    Navigator.pop(context);
                    //Navigator.pushReplacementNamed(context, item['route']!);
                    Navigator.pushNamed(context, item['route']!);
                  },
              )
            ).toList()
          )          
        ],
      ),
    );
  }
}

class _DrawerHeaderAlternative extends StatelessWidget {
  const _DrawerHeaderAlternative({
    Key? key,
  }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(  
      padding: EdgeInsets.zero,               
      child: Stack(
        children: [
          Positioned(
            top: -90,
            child: Container(            
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)              
              ),
              transform: Matrix4.rotationZ(0.2),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 140,
            child: Container(            
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.redAccent.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10)              
              ),
              transform: Matrix4.rotationZ(0.9),
            ),
          ),
          Positioned(
            top: 30,
            right: 35,            
            child: Container(            
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10)              
              ),
              transform: Matrix4.rotationZ(0.9),
            ),
          ),
          Positioned(
            top: 10,
            right: 30,
            child: Container(            
              width: 20,
              height: 20,             
              decoration: BoxDecoration(
                color: DefaultTheme.primary.withOpacity(0.4),
                borderRadius: BorderRadius.circular(5)
              ),
            ),
          ),
          Container(        
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.symmetric(horizontal: 10), 
            child: const Text(
                          '[  Menu  ]',                           
                          style: TextStyle(                                  
                                  fontSize: 13,
                                  color:Colors.black54,                                  
                                  fontFamily: 'RobotoMono'
                                ),
                          textAlign: TextAlign.right,                    
                        ),
          ),
        ]
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(      
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/background_menu_drawer2.png'),
            fit: BoxFit.fill,
            opacity: 0.9
          )
      ),
      child: Container(        
        alignment: Alignment.bottomRight,
        child: const Text(
                      '[  Menu  ]', 
                      style: TextStyle(
                              color: DefaultTheme.primary,                    
                              fontSize: 19
                            ),
                      textAlign: TextAlign.right,                    
        ),
      ),
    );
  }
}