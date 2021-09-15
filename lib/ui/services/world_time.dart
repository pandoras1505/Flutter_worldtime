import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime {
  late String location; // location name for the UI
  late String time; // the time in that location
  late String flag; //url to an asset flag icon
  late String puturl; //url entrer par l'utilisateur. exemple Africa/Lome
  late bool isDaytime; // true or false is date time or not

  //constructeur
  WorldTime({required this.location, required this.flag, required this.puturl});

  Future<void> getTime() async {
    //Gestion des erreurs

    try {
      //Création de la variable url
      var url = Uri.http('worldtimeapi.org', 'api/timezone/$puturl');

      //Création de la requette
      var response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      //print(jsonData);

      // get propreties from jsonData
      String datetime = jsonData['datetime'];

      //normalement l'affichage c'est +01:00 mais avec le substring, on enlève = le + et le :00
      String offset = jsonData['utc_offset'].substring(1, 3);

      //print(datetime);
      //print(offset);

      //création de l'objet datetime
      var now = DateTime.parse(datetime);

      now = now.add(Duration(hours: int.parse(offset)));

      // set time proprety
      //time = now.toString();

      //utilisation de la méthode DateFormat du package Inl pour amélioré l'affichage de l'heure

      isDaytime = now.hour > 6 && now.hour < 18? true : false;

      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Oups ! erreure détecté: $e');
      time = "l'heure n'a pas pu être récupéré";
    }
  }
}
