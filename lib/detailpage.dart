import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';

class DetailPage extends StatefulWidget {
  String country;
  var total,active,recovered,death,new_cases,new_death,serious;
  DetailPage(this.country,this.total,this.active,this.recovered,this.death,this.new_cases,
  this.new_death,this.serious,
  );

  @override
  _DetailPageState createState() => _DetailPageState(
    country,total,active,recovered,death,new_cases,new_death,
    serious,
    );
}

class _DetailPageState extends State<DetailPage> {
  String country;
  var total,active,recovered,death,new_cases,new_death,serious;
   _DetailPageState(this.country,this.total,this.active,this.recovered,this.death,this.new_cases,
  this.new_death,this.serious,
  );
  @override
  void initState() {
    super.initState();
  }
  @override
 
  commaRemover(String str){
   return int.parse(str.replaceAll(",", ""));
  }
  
  recoveredpercentage(){
    var b=commaRemover(death);
    var a=commaRemover(recovered);
    if(a+b>0)
    return ((a/(a+b))*100).round();
    else return 0;
  }
  closedCases(){
    if(recovered=="N/A")
     return "N/A";
     else
    return commaRemover(death)+ commaRemover(recovered);
  }
  
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        child: Scaffold( 
          backgroundColor: Color.fromARGB(255, 18, 21, 23),
         body: Stack(
           children: <Widget>[
             Column(
               children: <Widget>[
                 Padding(padding: EdgeInsets.all(20)),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Card(
                            color:Color.fromARGB(255, 29, 35, 41),
                              child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width/1.2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    AutoSizeText(" "+country.toUpperCase(),
                                    maxLines: 1,
                                    minFontSize: 18,
                                    maxFontSize: 18,
                                    textScaleFactor: 0.8,
                                    style: TextStyle(fontSize:20,letterSpacing: 1,fontWeight: FontWeight.bold),
                                    ),
                                    Icon(Icons.my_location,color: Colors.white54,size: 15,),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(10)),   
                 Container(
                 width: double.infinity,
                 height: MediaQuery.of(context).size.height/3,
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     fit: BoxFit.fill,
                     image: AssetImage("Assets/Images/VectorSmartObject.png")
                     )
                 ),
                  ),
               ],
             ),
             Column(
               children: <Widget>[
               Container(
                 height: MediaQuery.of(context).size.height/2
               ),
                 Row(
                         children: <Widget>[
                           Container(
                             height: 60,
                             width: MediaQuery.of(context).size.width/1.02,
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: <Widget>[
                                 Card(
                                   color: Colors.cyan,
                                    child: Container(
                                     width:MediaQuery.of(context).size.width/20,
                                     height: MediaQuery.of(context).size.width/20,
                                   ),
                                 ),
                                  Container(
                                  width:MediaQuery.of(context).size.width/3.5,
                                   child:Center(child: AutoSizeText("Confirmed",
                                    minFontSize: 20,
                                    maxFontSize: 20,
                                    textScaleFactor: 0.8,
                                   maxLines:1,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),))
                                 ),
                                  Container(
                                   width:MediaQuery.of(context).size.width/2.5,
                                   child:Row(
                                     children: <Widget>[
                                       AutoSizeText(total+" ",maxLines:1,
                                       minFontSize: 20,
                                       maxFontSize: 20,
                                       textScaleFactor: 0.8,style: TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Colors.white60),),
                                       (new_cases==""||new_cases=="0")?Container():Icon(Icons.arrow_upward,color: Colors.cyan,size: 12,),
                                       (new_cases==""||new_cases=="0")?Container():AutoSizeText(new_cases,maxLines:1,
                                       minFontSize: 12,
                                       maxFontSize: 12,
                                       textScaleFactor: 0.8,style: TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Colors.cyan),),
                                     ],
                                   )
                                 ),
                               ],
                             ),
                             )
                         ],
                       ),  
                      Row(
                         children: <Widget>[
                           Container(
                             height: 60,
                             width: MediaQuery.of(context).size.width/1.02,
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: <Widget>[
                                 Card(
                                   color: Colors.deepPurple,
                                    child: Container(
                                     width:MediaQuery.of(context).size.width/20,
                                     height: MediaQuery.of(context).size.width/20,
                                   ),
                                 ),
                                  Container(
                                  width:MediaQuery.of(context).size.width/3.5,
                                   child:Center(child: AutoSizeText("Active",
                                    minFontSize: 20,
                                    maxFontSize: 20,
                                    textScaleFactor: 0.8,
                                   maxLines:1,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),))
                                 ),
                                  Container(
                                   width:MediaQuery.of(context).size.width/2.5,
                                   child:Row(
                                     children: <Widget>[
                                       AutoSizeText(active.toString()+" ",maxLines:1,
                                       minFontSize: 20,
                                       maxFontSize: 20,
                                       textScaleFactor: 0.8,style: TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Colors.white60),),
                                       //(serious==""||serious=="0")?Container():Icon(Icons.arrow_upward,color: Colors.cyan,size: 12,),
                                       (serious==""||serious=="0")?Container():AutoSizeText(" ("+serious+") serious",maxLines:1,
                                       minFontSize: 12,
                                       maxFontSize: 12,
                                       textScaleFactor: 0.8,style: TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Colors.yellow),),
                                     
                                     ],
                                   )
                                 ),
                               ],
                             ),
                             )
                         ],
                       ),  
                      Row(
                         children: <Widget>[
                           Container(
                             height: 60,
                             width: MediaQuery.of(context).size.width/1.02,
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: <Widget>[
                                 Card(
                                   color: Colors.green,
                                    child: Container(
                                     width:MediaQuery.of(context).size.width/20,
                                     height: MediaQuery.of(context).size.width/20,
                                   ),
                                 ),
                                  Container(
                                  width:MediaQuery.of(context).size.width/3.5,
                                   child:Center(child: AutoSizeText("Recovered",
                                    minFontSize: 20,
                                    maxFontSize: 20,
                                    textScaleFactor: 0.8,
                                   maxLines:1,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),))
                                 ),
                                  Container(
                                   width:MediaQuery.of(context).size.width/2.5,
                                   child:Row(
                                     children: <Widget>[
                                       AutoSizeText(recovered+" ",maxLines:1,
                                       minFontSize: 20,
                                       maxFontSize: 20,
                                       textScaleFactor: 0.8,style: TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Colors.white60),),
                                      
                                     ],
                                   )
                                 ),
                               ],
                             ),
                             )
                         ],
                       ),  
                Row(
                         children: <Widget>[
                           Container(
                             height: 60,
                             width: MediaQuery.of(context).size.width/1.02,
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: <Widget>[
                                 Card(
                                   color: Color.fromARGB(255, 194, 46, 65),
                                    child: Container(
                                     width:MediaQuery.of(context).size.width/20,
                                     height: MediaQuery.of(context).size.width/20,
                                   ),
                                 ),
                                  Container(
                                  width:MediaQuery.of(context).size.width/3.5,
                                   child:Center(child: AutoSizeText("Deaths",
                                    minFontSize: 20,
                                    maxFontSize: 20,
                                    textScaleFactor: 0.8,
                                   maxLines:1,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),))
                                 ),
                                  Container(
                                   width:MediaQuery.of(context).size.width/2.5,
                                   child:Row(
                                     children: <Widget>[
                                       AutoSizeText(death.toString()+" ",maxLines:1,
                                       minFontSize: 20,
                                       maxFontSize: 20,
                                       textScaleFactor: 0.8,style: TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Colors.white60),),
                                       (new_death==""||new_death=="0")?Container():Icon(Icons.arrow_upward,color:Color.fromARGB(255, 194, 46, 65),size: 12,),
                                       (new_death==""||new_death=="0")?Container():AutoSizeText(new_death,maxLines:1,
                                       minFontSize: 12,
                                       maxFontSize: 12,
                                       textScaleFactor: 0.8,style: TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Color.fromARGB(255, 194, 46, 65)),),
                                     ],
                                   )
                                 ),
                               ],
                             ),
                             )
                         ],
                       ),  
                      Row(
                         children: <Widget>[
                           Container(
                             height: 60,
                             width: MediaQuery.of(context).size.width/1.02,
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: <Widget>[
                                 Card(
                                   color: Colors.brown,
                                    child: Container(
                                     width:MediaQuery.of(context).size.width/20,
                                     height: MediaQuery.of(context).size.width/20,
                                   ),
                                 ),
                                  Container(
                                  width:MediaQuery.of(context).size.width/3.5,
                                   child:Center(child: AutoSizeText("Closed",
                                    minFontSize: 20,
                                    maxFontSize: 20,
                                    textScaleFactor: 0.8,
                                   maxLines:1,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),))
                                 ),
                                  Container(
                                   width:MediaQuery.of(context).size.width/2.5,
                                   child:Row(
                                     children: <Widget>[
                                       AutoSizeText(closedCases().toString()+" ",maxLines:1,
                                       minFontSize: 20,
                                       maxFontSize: 20,
                                       textScaleFactor: 0.8,style: TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Colors.white60),),
                                      
                                     ],
                                   )
                                 ),
                               ],
                             ),
                             )
                         ],
                       ),  
                

               ],
             )
           ],
         ),
        )
      );
   }
  }

    