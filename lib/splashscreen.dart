import 'package:flutter/material.dart';
import 'package:newsapp/landingpage.dart';
import 'dart:io';

import 'package:newsapp/reload.dart';
class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() { 
    super.initState();
    changeScreen();
  }
   Future changeScreen() async {
   try{

   final res= await InternetAddress.lookup('google.com');
   if (res.isNotEmpty && res[0].rawAddress.isNotEmpty){
      await Future.delayed(const Duration(seconds: 2),(){
      Navigator.of(context).pushReplacement(
      MaterialPageRoute<Null>(
      builder:(BuildContext context){
      return LandingPage();
    }));
   });
   }
  
   } on SocketException catch(_){
    Navigator.of(context).pushReplacement(
   MaterialPageRoute<Null>(
   builder:(BuildContext context){
      return Reload();
    }));
   }
   }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 18, 21, 23),
            ),
          ),
          Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("Assets/Images/Group55.png")
                        )
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                   CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
                      backgroundColor: Colors.deepPurple,
                    ),
                    Text("wait e minute",style: TextStyle(color: Colors.white54,fontSize: 14,letterSpacing: 2),)
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}