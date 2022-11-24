// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

import 'package:flutter_app/models/info_clima.dart';

class ClimaSemanalModel {

  static ClimaSemanal fromJson(String str) => ClimaSemanal.fromJson(json.decode(str));
}

class ClimaSemanal {
    ClimaSemanal({
        required this.cod,
        required this.message,
        required this.cnt,
        required this.list,
        required this.city,
    });

    String cod;
    int message;
    int cnt;
    List<InfoClima> list;
    City city;

    factory ClimaSemanal.fromJson(Map<String, dynamic> json) => ClimaSemanal(
        cod: json["cod"],
        message: json["message"],
        cnt: json["cnt"],
        list: List<InfoClima>.from(json["list"].map((x) => InfoClima.fromJson(x))),
        city: City.fromJson(json["city"]),
    );
}

class City {
    City({
        required this.id,
        required this.name,
        required this.coord,
        required this.country,
        required this.population,
        required this.timezone,
        required this.sunrise,
        required this.sunset,
    });

    int id;
    String name;
    Coord coord;
    String country;
    int population;
    int timezone;
    int sunrise;
    int sunset;

    factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        coord: Coord.fromJson(json["coord"]),
        country: json["country"],
        population: json["population"],
        timezone: json["timezone"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
    );
}


