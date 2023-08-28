
import 'package:flutter/material.dart';
import 'dart:convert';
//import 'package:http/http.dart'as https;
import 'package:http/http.dart';


class Home extends StatefulWidget {


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};

  @override
  Widget build(BuildContext context) {

    try{
      data= data.isEmpty? ModalRoute.of(context)!.settings.arguments as Map: data;
      print("---");
      print(data);
      print("---");



    }
    catch(e){
      print("Home.dart error: $e");
    }
    String backImage=data['isDayTime']? 'day.png':'night.png';
    return Scaffold(

      body:

         SafeArea(
          child:Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$backImage'),
                fit:BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(

                children: [
                  TextButton.icon(
                  onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context,'/choose_location');
                    setState(() {
                      data={
                        'time':result['time'],
                        'location':result['location'],
                        'isDayTime':result['isDayTime'],
                        'flag':result['flag'],

                      };
                    });
                    },
                      icon: Icon(Icons.location_on,
                      color: Colors.white,),
                      label: Text("change location",
                      style:TextStyle(
                          color: Colors.white,
                      )),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),

        ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(data['location'],
                      style:TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white,

                      )),
                    ],
                  ),
                  SizedBox(height:10.0),
                  Text(data['time'],
                  style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                    color:Colors.white,
                  ),

                  ),

                SizedBox(height:30.0),



                ],
              ),
            ),
          )
    ),

    );
  }
}