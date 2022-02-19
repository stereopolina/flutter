import 'package:flutter/material.dart';
import 'package:assignment1/helpers/appcolors.dart';

class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget goToPage;

  SplashPage({required this.goToPage, required this.duration});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => this.goToPage));
    });
    return Scaffold(
        body: Container(
            color: AppColors.GREY,
            child: Center(
              child: Container(
                  width: 400,
                  height: 400,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/logo.png')
                  // Icon(Icons.favorite, color: Colors.white, size: 100)
                  ),
            )));
  }
}
