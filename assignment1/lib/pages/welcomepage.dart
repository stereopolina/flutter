// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:assignment1/helpers/appcolors.dart';
import 'package:assignment1/pages/jokepage.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: AppColors.GREY,
      child: Stack(
        children: [
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                    width: 400,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/logo.png')),
              ),
              SizedBox(height: 20),
              Container(
                  alignment: Alignment.center,
                  width: 100,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text('Wanna hear a funny story\nfrom Chuck Norris?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Courier New',
                            color: AppColors.BLACK,
                            fontSize: 26,
                          )),
                      SizedBox(height: 40),
                      Material(
                          color: AppColors.ORANGE,
                          child: InkWell(
                              borderRadius: BorderRadius.circular(40),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => JokePage()));
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'RANDOM JOKE',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Cartoon',
                                        color: AppColors.BLACK,
                                        fontSize: 30),
                                  )))),
                      SizedBox(
                        height: 30,
                      ),
                      Material(
                          color: AppColors.ORANGE,
                          child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CategoriesPage()));
                              },
                              child: Container(
                                  width: 300,
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'CHOOSE CATEGORY',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Cartoon',
                                        color: AppColors.BLACK,
                                        fontSize: 30),
                                  ))))
                    ],
                  ))
            ],
          ))
        ],
      ),
    ));
  }
}
