import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:newsapp/splashscreen.dart';
class Reload extends StatelessWidget {
  const Reload({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 18, 21, 23),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
         Stack(
           alignment: Alignment.center,
           children: <Widget>[
            Container(
            height: MediaQuery.of(context).size.height/3,
            decoration: BoxDecoration(
             color:Color.fromARGB(255, 29, 35, 41),
              shape: BoxShape.circle,
            ),
          ),
            Container(
            height: 150,
            width: 150,
              child: SvgPicture.asset("Assets/Images/astonaut.svg")
              ),
           ],
         ),
         SizedBox(height:  MediaQuery.of(context).size.height/20,),
          AutoSizeText("No Connection",
           minFontSize: 20,
           maxFontSize: 20,  
           textScaleFactor: 0.8,
           style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),  

          ),
          SizedBox(height:  MediaQuery.of(context).size.height/20,),
           AutoSizeText("You are 404 million kilometers away from us.",
           minFontSize: 14,
           maxFontSize: 14,  
           textScaleFactor: 0.8,
           style: TextStyle(color: Colors.white70,),       
          ),
          AutoSizeText("Please tap on refresh button to try connecting back.",
           minFontSize: 14,
           maxFontSize: 14,  
           textScaleFactor: 0.8,
           style: TextStyle(color: Colors.white70,),       
          ),
          SizedBox(height:  MediaQuery.of(context).size.height/20,),
          Container(
            width: MediaQuery.of(context).size.width/1.2,
            height: 40,
            child: RaisedButton(
              color: Colors.deepPurple,
              child:  AutoSizeText("REFRESH NOW",
                  minFontSize: 17,
                  maxFontSize: 17,  
                  textScaleFactor: 0.8,
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),       
                 ),
              onPressed:(){
             Navigator.of(context).pushReplacement(
               MaterialPageRoute<Null>(
               builder:(BuildContext context){
               return SplashScreen();
              }));
              }
              ),
          )
        ],
      ),
    );
  }
}