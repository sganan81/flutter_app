import 'package:flutter/material.dart';

class BackgroundLogin extends StatelessWidget {

  final Widget child;
  final IconData icon;

  const BackgroundLogin({
      super.key,
      required this.child, 
      required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(      
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.red,
        gradient: LinearGradient(
          colors: <Color>[
            Color.fromARGB(255, 15, 54, 99),
            Color.fromARGB(255, 102, 56, 119),            
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.2,0.93]
        )
      ),
      child: Stack(
         children:[ 
          _IconBackground(iconBackground:this.icon),
          
          this.child
        ],
      )
    );
  }
}

class _IconBackground extends StatelessWidget {
  final IconData iconBackground;

  const _IconBackground({
      super.key, 
      required this.iconBackground
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only( top: 30 ),
        child: Icon( 
          iconBackground, 
          color: Color.fromARGB(220, 104, 235, 241), size: 90 
        ),
      ),
    );
  }
}