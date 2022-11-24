import 'package:flutter/material.dart';
import 'package:flutter_app/models/info_clima.dart';
import 'package:flutter_app/models/clima_semanal.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ClimaProvider extends ChangeNotifier{

  final String _apiKey = dotenv.env['API_KEY_CLIMA'].toString();
  final String _baseUrl = 'api.openweathermap.org';
  bool loadData = false;

  List<InfoClima> clima = [];

  ClimaProvider(){
    print('Clima Provider   init....................');
    this.getClimaSemanal();

  }

  getClimaSemanal() async{
      final url = Uri.https(_baseUrl, '/data/2.5/forecast', {
        'appid':_apiKey,
        'lang':'Es',
        'units':'metric',
        'lat':'-38.71',
        'lon':'-62.26'
      });

      

    //final data = json.decode(response.body);    
    try {
      
      final response = await http.get(url); 
      
      final data = ClimaSemanalModel.fromJson(response.body);           
      this.clima = [...data.list];
      this.loadData = true;  
    } catch (e) {
      print('error $e');
    }
    notifyListeners();
    
  }

}