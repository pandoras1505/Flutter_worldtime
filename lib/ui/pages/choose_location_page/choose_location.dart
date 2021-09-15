import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_worldtime/ui/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'London', flag: 'uk.png', puturl: 'Europe/London'),
    WorldTime(location: 'Athens', flag: 'greece.png', puturl: 'Europe/Berlin'),
    WorldTime(location: 'Cairo', flag: 'egypt.png', puturl: 'Africa/Cairo'),
    WorldTime(location: 'Nairobi', flag: 'kenya.png', puturl: 'Africa/Nairobi'),
    WorldTime(location: 'Chicago', flag: 'usa.png', puturl: 'America/Chicago'),
    WorldTime(
        location: 'New_York', flag: 'usa.png', puturl: 'America/New_York'),
    WorldTime(location: 'Seoul', flag: 'south_korea.png', puturl: 'Azia/Seoul'),
    WorldTime(
        location: 'Jakarta', flag: 'indonesia.png', puturl: 'Azia/Jakarta'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    // navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build function run');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
