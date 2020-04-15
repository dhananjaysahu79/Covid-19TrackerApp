import 'package:flutter/material.dart';
import 'package:newsapp/splashscreen.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:SplashScreen(),
       theme: ThemeData(
        fontFamily: "GoogleSans",
        scaffoldBackgroundColor: Color.fromARGB(255, 18, 21, 23),
        cardColor:Color.fromARGB(255, 29, 35, 41),    
        canvasColor: Color.fromARGB(255, 18, 21, 23),
        primaryColorLight: Colors.white54,
        textTheme: TextTheme(
          title:TextStyle(color: Colors.white54),
          subtitle: TextStyle(color: Colors.white54),
          headline: TextStyle(color: Colors.white54),
          body1: TextStyle(color: Colors.white54),
          caption: TextStyle(color: Colors.white54),
          body2: TextStyle(color: Colors.white54),
          display1: TextStyle(color: Colors.white54),
          display2: TextStyle(color: Colors.white54),
          display3: TextStyle(color: Colors.white54),
          display4: TextStyle(color: Colors.white54)
        ),
        
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}


