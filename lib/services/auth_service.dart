
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;


class AuthFirebaseService extends ChangeNotifier {

  final String _firebaseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseKey = dotenv.env['API_KEY_FIREBASE'].toString();

  Future<String?> createUser(String email, String password, [String fullname = '']) async{
    final Map<String, dynamic> userData = {
      'email': email,
      'password':password,
      'displayName':fullname,
      'returnSecureToekn':true
    };

    final url = Uri.https(_firebaseUrl, '/v1/accounts:signUp',{
      'key':_firebaseKey
    });

    print('Comienzo registro usuario.............');
    final resp = await http.post(url, body: json.encode(userData));
    final Map<String, dynamic> result = json.decode(resp.body);
    
    if(result.containsKey('idToken')){
      return null;
    }else{
      return result['error']['message'];
    }
  }

  Future<String?> loginUser(String email, String password) async{
    final Map<String, dynamic> userData = {
      'email': email,
      'password':password,      
      'returnSecureToekn':true
    };

    final url = Uri.https(_firebaseUrl, '/v1/accounts:signInWithPassword',{
      'key':_firebaseKey
    });
    print('Comienzo login usuario.............');
    final resp = await http.post(url, body: json.encode(userData));
    final Map<String, dynamic> result = json.decode(resp.body);
    
    if(result.containsKey('idToken')){
      return null;
    }else{
      return result['error']['message'];
    }
  }

}