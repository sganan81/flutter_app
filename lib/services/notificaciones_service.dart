import 'package:flutter/material.dart';


class NotificacionesService{

  static GlobalKey<ScaffoldMessengerState> message = new GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String msg){

    final snackBar = SnackBar(
      content: Text(msg, style: const TextStyle(fontSize: 18, color: Colors.white)),
      padding: const EdgeInsets.all(15),     
      dismissDirection: DismissDirection.endToStart,
      duration: const Duration(milliseconds: 2500),
      action:SnackBarAction(        
        label: 'Cerrar', 
        textColor: const Color.fromARGB(220, 104, 235, 241),
        onPressed: () { 
            print('on press snackar');
            message.currentState?.hideCurrentSnackBar();
        },

      )     
    );

    message.currentState!.showSnackBar(snackBar);

  }

}