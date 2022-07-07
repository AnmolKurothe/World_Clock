import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin',flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushNamed(context, '/home' , arguments:{
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime' : instance.isDaytime,
    });

  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
         child: SpinKitPouringHourGlassRefined(
           color: Colors.white,
           size: 80.0,
         ),
      ),
      backgroundColor: Colors.blue[900],
    );
  }
}
