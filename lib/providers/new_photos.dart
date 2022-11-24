

import 'package:flutter/material.dart';
import 'package:flutter_app/models/photo_info.dart';
import 'package:flutter_app/models/photo_news.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class PhotosProvider extends ChangeNotifier{

  final String _apiKey = dotenv.env['API_KEY_UNSPLASH'].toString();
  final String _baseUrl = 'api.unsplash.com';

  List<PhotoInfo> photos = [];

  PhotosProvider(){
    print('PhotosProvider   init....................');
    this.getNewPhotos();

  }

  getNewPhotos() async{
      final url = Uri.https(_baseUrl, '/photos', {
        'client_id':_apiKey
      });

      final response = await http.get(url); 

      print(response.body);

      //final data = json.decode(response.body);    
      
      final data = NewPhotosModel.fromJson(response.body);    

      this.photos = [...data];
      
      notifyListeners();
  }

}