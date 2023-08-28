import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/loading.dart';
import 'pages/choose_location.dart';
import 'package:http/http.dart';

void main() {
  runApp(MaterialApp(

    initialRoute:'/choose_location' ,
    routes:{
      '/':(context)=>Loading(),
      '/home':(context)=>Home(),
      '/choose_location':(context)=>ChooseLocation(),
    }
  ));
}

