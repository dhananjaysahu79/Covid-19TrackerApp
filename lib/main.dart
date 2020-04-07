import 'package:flutter/material.dart';
import 'coviddata.dart';
import 'detailpage.dart';
void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:CovidData(),
      //theme: ThemeData.dark(),
      darkTheme: ThemeData(
        fontFamily: "GoogleSans",
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}


