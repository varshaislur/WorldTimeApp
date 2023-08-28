import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:world_time_app/services/world_time.dart';

class Loading extends StatefulWidget {


  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
String t="loading";
  void setupWorldTime () async
  {
    WorldTime instance=WorldTime(location:'Berlin', flag:'germany.png' , url: 'Europe/Berlin');
    await instance.getTime();
      Navigator.pushReplacementNamed(context, '/home',arguments: {
        'location':instance.location ,
        'time':instance.time,
        'flag':instance.flag,
        'isDayTime':instance.isDayTime,
      });
    setState(() {
      t=instance.time;
    });
  }



  @override
  void initState() {
    // TODO: implement initState
    setupWorldTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Text("loading"),
    );
  }
}
