import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:assignment1/pages/splashpage.dart';
import 'package:assignment1/pages/welcomepage.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(
        duration: 3,
        goToPage: WelcomePage(),
      )));
}
