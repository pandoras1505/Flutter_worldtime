//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_worldtime/ui/pages/choose_location_page/choose_location.dart';
import 'package:flutter_worldtime/ui/pages/home_page/home_page.dart';
import 'package:flutter_worldtime/ui/pages/loading_page/loading_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    
    //Définition des routes de l'appli
    initialRoute: '/',
    
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation()
    },
  ));
}

