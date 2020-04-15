import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Safety extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 18, 21, 23),
      appBar: AppBar(
      backgroundColor:Color.fromARGB(255, 29, 35, 41),
      title:AutoSizeText("SAFETY MEASURES",
         minFontSize: 18,
         maxFontSize: 18,
         textScaleFactor: 0.8,
      )
    ),
    body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left:26.0,top: 26),
            child: AutoSizeText("Summary",
            minFontSize: 23,
            maxFontSize: 23,  
            textScaleFactor: 0.8,
            style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),        
            ),
          ),
         Row(
           children: <Widget>[  
           Expanded(
            child: Padding(
              padding: const EdgeInsets.all(26.0),
              child: AutoSizeText("Coronavirus disease(Covid-19) is an infectious disease caused by a newly discovered coronavirus.\nPeople may be sick with the virus for 1 to 14 days without any symptoms mentioned below.",
              minFontSize: 15,
              maxFontSize:15,  
              textScaleFactor: 0.8        
              ),
            ),
             )
         ],),
         Padding(
            padding: const EdgeInsets.only(left:26.0,top: 8),
            child: AutoSizeText("Symptoms",
            minFontSize: 23,
            maxFontSize: 23,  
            textScaleFactor: 0.8,
            style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),        
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:18.0,top: 18),
            child: Container(
              width:double.infinity,
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  //1st
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                            decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topRight:Radius.circular(8),topLeft: Radius.circular(8)),
                            image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage("Assets/Images/body_pain.png")
                           )
                            ),
                            height:100,
                            width:100,
                          ),
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(bottomRight:Radius.circular(8),bottomLeft: Radius.circular(8)),
                          ),
                          child:  Center(
                            child: AutoSizeText("Body Pain",
                            minFontSize: 15,
                            maxFontSize: 15,  
                            textScaleFactor: 0.8,
                            style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black),        
                         ),
                          ),
                        )
                      ],
                    ),
                  ),
                  //2nd
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        //1st
                        Container(
                            decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topRight:Radius.circular(8),topLeft: Radius.circular(8)),
                            image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage("Assets/Images/fever.png")
                           )
                            ),
                            height:100,
                            width:100,
                          ),
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(bottomRight:Radius.circular(8),bottomLeft: Radius.circular(8)),
                          ),
                          child:  Center(
                            child: AutoSizeText("Fever",
                            minFontSize: 15,
                            maxFontSize: 15,  
                            textScaleFactor: 0.8,
                            style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black),        
                         ),
                          ),
                        )
                      ],
                    ),
                  ),

                  //3rd
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        //1st
                        Container(
                            decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topRight:Radius.circular(8),topLeft: Radius.circular(8)),
                            image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage("Assets/Images/running_nose.png")
                           )
                            ),
                            height:100,
                            width:100,
                          ),
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(bottomRight:Radius.circular(8),bottomLeft: Radius.circular(8)),
                          ),
                          child:  Center(
                            child: AutoSizeText("Runny Nose",
                            minFontSize: 15,
                            maxFontSize: 15,  
                            textScaleFactor: 0.8,
                            style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black),        
                         ),
                          ),
                        )
                      ],
                    ),
                  ),
                  //4th
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        //1st
                        Container(
                            decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topRight:Radius.circular(8),topLeft: Radius.circular(8)),
                            image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage("Assets/Images/head_ache.png")
                           )
                            ),
                            height:100,
                            width:100,
                          ),
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(bottomRight:Radius.circular(8),bottomLeft: Radius.circular(8)),
                          ),
                          child:  Center(
                            child: AutoSizeText("Headache",
                            minFontSize: 15,
                            maxFontSize: 15,  
                            textScaleFactor: 0.8,
                            style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black),        
                         ),
                          ),
                        )
                      ],
                    ),
                  ),
                  //5th
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        //1st
                        Container(
                            decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topRight:Radius.circular(8),topLeft: Radius.circular(8)),
                            image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage("Assets/Images/cough.png")
                           )
                            ),
                            height:100,
                            width:100,
                          ),
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(bottomRight:Radius.circular(8),bottomLeft: Radius.circular(8)),
                          ),
                          child:  Center(
                            child: AutoSizeText("Dry Cough",
                            minFontSize: 15,
                            maxFontSize: 15,  
                            textScaleFactor: 0.8,
                            style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black),        
                         ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:26.0,top: 8),
            child: AutoSizeText("Precautions",
            minFontSize: 23,
            maxFontSize: 23,  
            textScaleFactor: 0.8,
            style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),        
            ),
          ),
         Padding(
           padding: const EdgeInsets.all(26.0),
           child: Container(
             height: 140,
             decoration: BoxDecoration(
               color: Color.fromARGB(255, 29, 35, 41),
               borderRadius: BorderRadius.circular(5)
             ),
             child: Row(
               children: <Widget>[
                 Container(
                   width: 120,
                   height: 100,
                   child: SvgPicture.asset("Assets/Images/wash_hands.svg"),
                 ),
                 VerticalDivider(color:Colors.white10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                         AutoSizeText("Hand-Wash\n",
                          minFontSize: 18,
                          maxFontSize: 18,  
                          textScaleFactor: 0.8,
                          style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white70),        
                        ),
                          AutoSizeText("Wash your hands regularly for 20 seconds,with soap and water or alcohol based hand sanitizers.",
                          minFontSize: 15,
                          maxFontSize: 15,  
                          textScaleFactor: 0.8,
                          style: TextStyle(color: Colors.white70),        
                        ),
                      ],
                  ),
                    ),
                )
               ],
             ),
           ),
         ),
         //2nd precaution
         Padding(
           padding: const EdgeInsets.only(left:26.0,right: 26,top:13,bottom: 13),
           child: Container(
             height: 140,
             decoration: BoxDecoration(
               color: Color.fromARGB(255, 29, 35, 41),
               borderRadius: BorderRadius.circular(5)
             ),
             child: Row(
               children: <Widget>[
                 Container(
                   width: 120,
                   height: 100,
                   child: SvgPicture.asset("Assets/Images/social_distance.svg"),
                 ),
                 VerticalDivider(color:Colors.white10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                         AutoSizeText("Social-Distancing\n",
                          minFontSize: 18,
                          maxFontSize: 18,  
                          textScaleFactor: 0.8,
                          style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white70),        
                        ),
                          AutoSizeText("Avoid close contact(1 meter or 3 feet) with people who are unwell. Use NAMASTE to greet",
                          minFontSize: 15,
                          maxFontSize: 15,  
                          textScaleFactor: 0.8,
                          style: TextStyle(color: Colors.white70),        
                        ),
                      ],
                  ),
                    ),
                )
               ],
             ),
           ),
         ),
         //3rd precaution
          Padding(
           padding: const EdgeInsets.only(left:26.0,right: 26,top:13,bottom: 13),
           child: Container(
             height: 140,
             decoration: BoxDecoration(
               color: Color.fromARGB(255, 29, 35, 41),
               borderRadius: BorderRadius.circular(5)
             ),
             child: Row(
               children: <Widget>[
                 Container(
                   width: 120,
                   height: 100,
                   child: SvgPicture.asset("Assets/Images/work_remotely.svg"),
                 ),
                 VerticalDivider(color:Colors.white10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                         AutoSizeText("Work from Home\n",
                          minFontSize: 18,
                          maxFontSize: 18,  
                          textScaleFactor: 0.8,
                          style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white70),        
                        ),
                          AutoSizeText("Ask your employer to allow you work from home.If not take necessary precautions.Remember that health is wealth. ",
                          minFontSize: 15,
                          maxFontSize: 15,  
                          textScaleFactor: 0.8,
                          style: TextStyle(color: Colors.white70),        
                        ),
                      ],
                  ),
                    ),
                )
               ],
             ),
           ),
         ),
         //4thprecaution
          Padding(
           padding: const EdgeInsets.only(left:26.0,right: 26,top:13,bottom: 13),
           child: Container(
             height: 140,
             decoration: BoxDecoration(
               color: Color.fromARGB(255, 29, 35, 41),
               borderRadius: BorderRadius.circular(5)
             ),
             child: Row(
               children: <Widget>[
                 Container(
                   width: 120,
                   height: 100,
                   child: SvgPicture.asset("Assets/Images/yoga.svg"),
                 ),
                 VerticalDivider(color:Colors.white10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                         AutoSizeText("Boost Immune\n",
                          minFontSize: 18,
                          maxFontSize: 18,  
                          textScaleFactor: 0.8,
                          style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white70),        
                        ),
                          AutoSizeText("Do Yoga,eat healthy diet, people with weaker immune system are more vulnerable to coronavirus. ",
                          minFontSize: 15,
                          maxFontSize: 15,  
                          textScaleFactor: 0.8,
                          style: TextStyle(color: Colors.white70),        
                        ),
                      ],
                  ),
                    ),
                )
               ],
             ),
           ),
         ),
          Padding(
           padding: const EdgeInsets.only(left:26.0,right: 26,top:13,bottom: 13),
           child: Container(
             height: 140,
             decoration: BoxDecoration(
               color: Color.fromARGB(255, 29, 35, 41),
               borderRadius: BorderRadius.circular(5)
             ),
             child: Row(
               children: <Widget>[
                 Container(
                   width: 120,
                   height: 100,
                   child: SvgPicture.asset("Assets/Images/whatsapp.svg"),
                 ),
                 VerticalDivider(color:Colors.white10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                         AutoSizeText("Fake News\n",
                          minFontSize: 18,
                          maxFontSize: 18,  
                          textScaleFactor: 0.8,
                          style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white70),        
                        ),
                          AutoSizeText("Dont believe in Whatsapp University,There is currently no vaccine for coronavirus,Dont believe in whatsapp news regarding vaccine. ",
                          minFontSize: 15,
                          maxFontSize: 15,  
                          textScaleFactor: 0.8,
                          style: TextStyle(color: Colors.white70),        
                        ),
                      ],
                  ),
                    ),
                )
               ],
             ),
           ),
         ),
          Padding(
           padding: const EdgeInsets.only(left:26.0,right: 26,top:13,bottom: 13),
           child: Container(
             height: 140,
             decoration: BoxDecoration(
               color: Color.fromARGB(255, 29, 35, 41),
               borderRadius: BorderRadius.circular(5)
             ),
             child: Row(
               children: <Widget>[
                 Container(
                   width: 120,
                   height: 100,
                   child: SvgPicture.asset("Assets/Images/consult.svg"),
                 ),
                 VerticalDivider(color:Colors.white10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                         AutoSizeText("Consult Doctor",
                          minFontSize: 18,
                          maxFontSize: 18,  
                          textScaleFactor: 0.8,
                          style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white70),        
                        ),
                          AutoSizeText("\nIf you find symptoms in you,Consult your doctor.Dont take medicines without consulting your doctor. ",
                          minFontSize: 15,
                          maxFontSize: 15,  
                          textScaleFactor: 0.8,
                          style: TextStyle(color: Colors.white70),        
                        ),
                      ],
                  ),
                    ),
                )
               ],
             ),
           ),
         ),
        ],
      ),
    ),
    );
  }
}