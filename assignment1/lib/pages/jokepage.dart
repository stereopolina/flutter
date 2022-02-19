// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:assignment1/helpers/appcolors.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String url = 'https://api.chucknorris.io/jokes/random';

List<String> sel_categories = [
  "animal",
  "career",
  "celebrity",
  "dev",
  "explicit",
  "fashion",
  "food",
  "history",
  "money",
  "movie",
  "music",
  "political",
  "religion",
  "science",
  "sport",
  "travel"
];

Future<Joke> fetchResponse(address) async {
  final response = await http.get(Uri.parse(address));

  if (response.statusCode == 200) {
    return Joke.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load jokes');
  }
}

class Joke {
  final String joke;

  const Joke({
    required this.joke,
  });

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      joke: json['value'],
    );
  }
}

class JokePage extends StatelessWidget {
  String selectedCategory;
  JokePage({this.selectedCategory = 'random'});

  String getUrl(category) {
    if (category == "random") {
      return url;
    }
    return (url + '?category=' + category);
  }

  String getrand() {
    Random random = new Random();
    int randomNumber = random.nextInt(5);
    String number = randomNumber.toString();
    return number;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: AppColors.GREY,
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                      width: 400,
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      child: Image.asset(
                          'assets/images/laugh' + getrand() + '.gif')),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: FutureBuilder<Joke>(
                    future: fetchResponse(getUrl(selectedCategory)),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data!.joke,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Courier New',
                              color: AppColors.BLACK,
                              fontSize: 20),
                        );
                      } else if (snapshot.hasError) {
                        return Text(
                          '${snapshot.error}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Courier New',
                              color: AppColors.BLACK,
                              fontSize: 20),
                        );
                      }
                      // By default, show a loading spinner.
                      return const CircularProgressIndicator();
                    },
                  ),
                ),
                Container(
                    width: 40,
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            width: 40,
                            color: AppColors.ORANGE,
                            padding: const EdgeInsets.all(10),
                            child: const Text(
                              'back',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Cartoon',
                                color: AppColors.BLACK,
                                fontSize: 30,
                              ),
                            ))))
              ])),
    );
  }
}

class CategoriesPage extends StatelessWidget {
  List<String> categories = sel_categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.GREY,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          SizedBox(height: 20),
          Container(
              width: 40,
              padding: const EdgeInsets.all(10),
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      width: 40,
                      color: AppColors.ORANGE,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'back',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Cartoon',
                          color: AppColors.BLACK,
                          fontSize: 30,
                        ),
                      )))),
          const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 0),
              child: Text(' select:',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'Cartoon',
                      color: Colors.black,
                      fontSize: 30))),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (BuildContext ctx, int index) {
                return CategoryCard(
                    category: categories[index],
                    onCardClick: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JokePage(
                                    selectedCategory: categories[index],
                                  )));
                    });
              },
            ),
          )
        ]),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  String category;
  Function onCardClick;
  CategoryCard({required this.category, required this.onCardClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          this.onCardClick();
        },
        child: Container(
            color: AppColors.BLUE,
            margin: EdgeInsets.only(top: 0.0, left: 20, right: 20, bottom: 20),
            height: 50,
            child: Stack(children: [
              Positioned(
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(this.category,
                          style: const TextStyle(
                              fontFamily: 'Cartoon',
                              color: Colors.black,
                              fontSize: 30))
                    ],
                  ),
                ),
              )
            ])));
  }
}
