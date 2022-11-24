// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_app/models/photo_info.dart';

class NewPhotosModel{

  static List<PhotoInfo> fromJson(String str) => List<PhotoInfo>.from(json.decode(str).map((x) => PhotoInfo.fromJson(x)));
  
}