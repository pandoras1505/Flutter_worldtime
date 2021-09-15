import 'package:flutter/material.dart';
import 'package:flutter_worldtime/ui/utilitises/k_strings.dart';
import 'dart:core';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    //cela veut dire que les arguments qu'il recevras du loading_page, qu'il le mette dans Map
    data = ModalRoute.of(context)!.settings.arguments as Map;

    print(data);

    // set background
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
            children: <Widget>[
              //Boutton
              TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                icon: Icon(Icons.edit_location,
                color: Colors.white),
                label: Text('Edit Location',
                style: TextStyle(
                  color: Colors.grey[300]
                ),),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(fontSize: 28.0, letterSpacing: 2.0,
                    color: Colors.white),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66.0,
                  color: Colors.white
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
