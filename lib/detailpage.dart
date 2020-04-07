import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'progress.dart';
class DetailPage extends StatefulWidget {
  String country;
  var total,active,recovered,death,new_cases,new_death,serious,world_cases,world_active,world_recovered,world_death,world_new_cases,world_new_death_cases;
  DetailPage(this.country,this.total,this.active,this.recovered,this.death,this.new_cases,
  this.new_death,this.serious,this.world_cases,this.world_active,this.world_recovered,this.world_death,
  this.world_new_cases,this.world_new_death_cases
  );

  @override
  _DetailPageState createState() => _DetailPageState(
    country,total,active,recovered,death,new_cases,new_death,
    serious,world_cases,world_active,world_recovered,world_death,world_new_cases,world_new_death_cases
    );
}

class _DetailPageState extends State<DetailPage> {
  String country;
  var total,active,recovered,death,new_cases,new_death,serious,world_cases,world_active,world_recovered,world_death,world_new_cases,world_new_death_cases;
   _DetailPageState(this.country,this.total,this.active,this.recovered,this.death,this.new_cases,
  this.new_death,this.serious,this.world_cases,this.world_active,this.world_recovered,this.world_death,
  this.world_new_cases,this.world_new_death_cases
  );
  @override
  void initState() {
   addData();
    super.initState();
  }
  @override
  
  commaRemover(String str){
   return int.parse(str.replaceAll(",", ""));
  }
  addData(){
    if(country=="WorldWide"){
      setState(() {
        recovered=world_recovered;
        death=world_death;
      });
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
     Padding(padding: EdgeInsets.all(10)),
     
     Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[         
          Card(
           
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              height:MediaQuery.of(context).size.height/3,
              width: MediaQuery.of(context).size.width/1.07,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.only(left:8.0,right: 38),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(country.toUpperCase(),
                          style:TextStyle(
                            fontSize:20,
                            fontWeight:FontWeight.bold
                          )
                          ),
                           Container(
                             height: MediaQuery.of(context).size.height/15,
                             width:  MediaQuery.of(context).size.width/3.5,
                             decoration: BoxDecoration(
                             color:Colors.cyan.withOpacity(0.4),
                             borderRadius: BorderRadius.circular(5)
                             ),
                             child: Padding(
                               padding: const EdgeInsets.all(6.0),
                               child: Text(country=="WorldWide"?"New Cases\n$world_new_cases":"New Cases\n$new_cases",
                               style:TextStyle(
                                fontSize:18,
                                fontWeight:FontWeight.bold
                          )
                          ),
                             ),
                           ),
                          Container(
                            height: MediaQuery.of(context).size.height/15,
                            width:  MediaQuery.of(context).size.width/3.5,
                            decoration: BoxDecoration(
                              color:Colors.deepPurple.withOpacity(0.4),
                             borderRadius: BorderRadius.circular(5)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(country=="WorldWide"?"Closed Cases\n"+(commaRemover(world_death)+commaRemover(world_recovered)).toString():"Serious Cases\n$serious",
                              style:TextStyle(
                                fontSize:18,
                                fontWeight:FontWeight.bold
                              )
                              ),
                            ),
                          ),
                          Container(
                             height: MediaQuery.of(context).size.height/15,
                            width:  MediaQuery.of(context).size.width/3.5,
                            decoration: BoxDecoration(
                              color:Colors.red.withOpacity(0.4),
                             borderRadius: BorderRadius.circular(5)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(country=="WorldWide"?"New Deaths\n$world_new_death_cases":"New Deaths\n$new_death",
                              style:TextStyle(
                                fontSize:18,
                                fontWeight:FontWeight.bold
                              )
                              ),
                            ),
                          ),
                          
                        ],
                      ),
                      //worldwideComaparison
                      
                      //ProgressBars
                     Padding( padding: const EdgeInsets.only(bottom: 2)),
                      Stack(
                        alignment: Alignment.center,
                        children:<Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width/2.8,
                            child: ProgressBar(((commaRemover(recovered)/(commaRemover(recovered)+commaRemover(death)))*100).round())
                            ),
                            Text(((commaRemover(recovered)/(commaRemover(recovered)+commaRemover(death)))*100).round().toString()+"%\n Recovered\nOut of\n"+
                            (commaRemover(recovered)+commaRemover(death)).toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize:16,
                              fontWeight:FontWeight.bold
                            ),),
                        ]
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
       ],
     ),
     //Total_Cases
    country=="WorldWide"?Container():Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
          height:MediaQuery.of(context).size.height/10,
          width:MediaQuery.of(context).size.width/1.07,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
             Container(
               width:MediaQuery.of(context).size.width/5,
               child: Center(
                 child: Container(
                   width: 20,
                   decoration:BoxDecoration(
                     shape:BoxShape.circle,
                     color:Colors.cyan.withOpacity(0.6)
                   )
                 ),
               ),
             ),
             Container(
               width:MediaQuery.of(context).size.width/3,
               child: Text(
                 "TotalCases\n$total",
                 style: TextStyle(fontSize:17,fontWeight:FontWeight.bold),
               ),
             ),
             Container(
               width:MediaQuery.of(context).size.width/3,
               child: Text(
                ((commaRemover(total)/commaRemover(world_cases))*100).toStringAsFixed(3).toString()+"% of total\ncases worldwide",
                 style: TextStyle(fontSize:17,fontWeight:FontWeight.bold),
               ),
             )
            ],
            ),
        ),
      )
    ],),
    //Total_Active_Cases
    country=="WorldWide"?Container():Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Card(
         
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
          height:MediaQuery.of(context).size.height/10,
          width:MediaQuery.of(context).size.width/1.07,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
             Container(
               width:MediaQuery.of(context).size.width/5,
               child: Center(
                 child: Container(
                   width: 20,
                   decoration:BoxDecoration(
                     shape:BoxShape.circle,
                     color:Colors.purple.withOpacity(0.6)
                   )
                 ),
               ),
             ),
             Container(
               width:MediaQuery.of(context).size.width/3,
               child: Text(
                 "Active Cases\n$active",
                 style: TextStyle(fontSize:17,fontWeight:FontWeight.bold),
               ),
             ),
             Container(
               width:MediaQuery.of(context).size.width/3,
               child: Text(
                ((commaRemover(active)/world_active)*100).toStringAsFixed(3).toString()+"% of active\ncases worldwide",
                 style: TextStyle(fontSize:17,fontWeight:FontWeight.bold),
               ),
             )
            ],
            ),
        ),
      )
    ],),
    //TotalRecovered
    country=="WorldWide"?Container(
      child: Text("Stay Home And Stay Safe.Lets Beat That Freakin Virus",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize:40,
        color: Colors.black38,
        fontWeight:FontWeight.bold
      ),
      ),
    ):Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
          height:MediaQuery.of(context).size.height/10,
          width:MediaQuery.of(context).size.width/1.07,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
             Container(
               width:MediaQuery.of(context).size.width/5,
               child: Center(
                 child: Container(
                   width: 20,
                   decoration:BoxDecoration(
                     shape:BoxShape.circle,
                     color:Colors.green.withOpacity(0.6)
                   )
                 ),
               ),
             ),
             Container(
               width:MediaQuery.of(context).size.width/3,
               child: Text(
                 "Recovered\n$recovered",
                 style: TextStyle(fontSize:17,fontWeight:FontWeight.bold),
               ),
             ),
             Container(
               width:MediaQuery.of(context).size.width/3,
               child: Text(
                ((commaRemover(recovered)/commaRemover(world_recovered))*100).toStringAsFixed(2).toString()+"% of recovered\n worldwide",
                 style: TextStyle(fontSize:17,fontWeight:FontWeight.bold),
               ),
             )
            ],
            ),
        ),
      )
    ],),
    //Deaths
    country=="WorldWide"?Container(

    ):Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Card(
         
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
          height:MediaQuery.of(context).size.height/10,
          width:MediaQuery.of(context).size.width/1.07,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
             Container(
               width:MediaQuery.of(context).size.width/5,
               child: Center(
                 child: Container(
                   width: 20,
                   decoration:BoxDecoration(
                     shape:BoxShape.circle,
                     color:Colors.red.withOpacity(0.8)
                   )
                 ),
               ),
             ),
             Container(
               width: MediaQuery.of(context).size.width/3,
               child: Text(
                 "Deaths\n$death",
                 style: TextStyle(fontSize:17,fontWeight:FontWeight.bold),
               ),
             ),
             Container(
               width: MediaQuery.of(context).size.width/3,
               child: Text(
                ((commaRemover(death)/commaRemover(world_death))*100).toStringAsFixed(3).toString()+"% of deaths\n worldwide",
                 style: TextStyle(fontSize:17,fontWeight:FontWeight.bold),
               ),
             )
            ],
            ),
        ),
      )
    ],),
    Padding(padding: EdgeInsets.all(5)),
      ],
       ),
     );
  }
}
