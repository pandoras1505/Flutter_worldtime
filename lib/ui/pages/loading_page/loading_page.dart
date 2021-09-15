import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_worldtime/ui/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //String time = 'loading...';

  Future<void> setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'Lome', flag: 'togo.png', puturl: 'Africa/Lome');
    await instance.getTime();

    //Après avoir exécuté instance.getTime() l'on est redirigé vers la home page
    // arguments permet d'attribué certaines propriété de la page à la nouvelle page home
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDaytime' : instance.isDaytime
    });

    /*  //print(instance.time); ici onchange la valeur loading de time par l'heure 
    setState(() {
      time = instance.time; 
    }); */
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
        body: Center(

      //SpinKit... est utiliser pour l'animation    
      child: SpinKitFadingCircle(
        color: Colors.white,
        size: 80,
        ),
    ));
  }
}
