import 'package:flutter/material.dart';
import 'package:flutter_app/screens/choose_location.dart';
import 'package:flutter_app/screens/home.dart';
import 'package:flutter_app/screens/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/':(context) => Loading(),
    '/home': (context) => Home(),
    '/location' : (context) => ChooseLocation(),
  },
));
