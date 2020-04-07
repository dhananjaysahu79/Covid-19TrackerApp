import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'progress.dart';
class IndiaDetail extends StatefulWidget {
 var state,recovered,death,new_cases,new_deaths,deltarecovered,totaltested;
  IndiaDetail(this.state,this.recovered,this.death,this.new_cases,this.new_deaths,this.deltarecovered,this.totaltested);

  @override
  _IndiaDetailState createState() => _IndiaDetailState(state,recovered,death,new_cases,new_deaths,deltarecovered,totaltested);
}

class _IndiaDetailState extends State<IndiaDetail> {
  var state,recovered,death,new_cases,new_deaths,deltarecovered,totaltested;
  _IndiaDetailState(this.state,this.recovered,this.death,this.new_cases,this.new_deaths,this.deltarecovered,this.totaltested);
  @override
  var decodedJson;
  ApiData apiData;
  Future<List<ApiData>> getData()async{
    var res = await http.get(Uri.encodeFull("https://api.covid19india.org/v2/state_district_wise.json"),
    );
    decodedJson = jsonDecode(res.body);
    int counter=0;
    List<ApiData> data =[];
    for(var v in decodedJson){
      if(v["state"]==state){
        break;
      }
      counter++;
    }
    for(var u in decodedJson[counter]["districtData"]){
     apiData =ApiData(
       u["district"],u["confirmed"],u["delta"]["confirmed"]
      );
      data.add(apiData);
    }
    print(counter);
    return data;
  }



  recoveredpercentage(){
    int a=int.parse(recovered);
    int b=int.parse(death);
    if(a+b>0)
    return ((a/(a+b))*100).round();
    else return 0;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(  
     children:<Widget>[
        Padding(padding: EdgeInsets.all(20)),
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
                      Container(
                        width: MediaQuery.of(context).size.width/2.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(state.toUpperCase(),
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
                                 child: Text("New Cases\n$new_cases",
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
                                color:Colors.green.withOpacity(0.6),
                               borderRadius: BorderRadius.circular(5)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text("New RCVD.\n"+deltarecovered,
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
                                child: Text("New Deaths\n$new_deaths",
                                style:TextStyle(
                                  fontSize:18,
                                  fontWeight:FontWeight.bold
                                )
                                ),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                      //worldwideComaparison
                      
                      //ProgressBars
                     Padding( padding: const EdgeInsets.only(bottom: 2)),
                      Stack(
                        alignment: Alignment.center,
                        children:<Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width/2.8,
                            child: ProgressBar(recoveredpercentage())
                            ),
                            Text(recoveredpercentage().toString()+"%\nRecovered out\nof Closed Cases",
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
          ),
       ],
     ),
    Row(
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
                     color:Colors.deepPurple
                   )
                 ),
               ),
             ),
             Container(
               width:MediaQuery.of(context).size.width/2,
               child: Text(
                 "Closed Cases",
                 style: TextStyle(fontSize:17,fontWeight:FontWeight.bold),
               ),
             ),
             Container(
               width:MediaQuery.of(context).size.width/4.3,
               child: Center(
                 child: Text(
              (int.parse(death)+int.parse(recovered)).toString(),
                   style: TextStyle(color: Colors.deepPurple,fontSize:23,fontWeight:FontWeight.bold),
                 ),
               ),
             )
            ],
            ),
        ),
      )
    ],),
    state=="Total"?Row(
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
                     color:Colors.purple
                   )
                 ),
               ),
             ),
             Container(
               width:MediaQuery.of(context).size.width/2,
               child: Text(
                 "Total Sample Tested",
                 style: TextStyle(fontSize:17,fontWeight:FontWeight.bold),
               ),
             ),
             Container(
               width:MediaQuery.of(context).size.width/4.3,
               child: Center(
                 child: Text(
              totaltested,
                   style: TextStyle(color: Colors.purple,fontSize:23,fontWeight:FontWeight.bold),
                 ),
               ),
             )
            ],
            ),
        ),
      )
    ],):Container(),
      state=="Total"?Container():Card(  
          child: Container(
             height: 35,
             width: MediaQuery.of(context).size.width/1.07,
             child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
              Container(
                   width:122,
                   child:Text("District",
                   style: TextStyle(
                     fontSize:20,
                     fontWeight:FontWeight.bold
                    ),
                  )
                 ),
                  Container(
                    color: Colors.cyan.withOpacity(0.4),
                       width:65,
                        child:Center(child: Text("Total",style: TextStyle(fontSize:16),))
                        ),
                 
                   Container(
                     color: Colors.red.withOpacity(0.4),
                      width:60,
                       child:Center(child: Text("New\nCases",style: TextStyle(fontSize:16),))
                 ),
                 ],
               ),
           ),
         ),
         
        state=="Total"?Container(): Expanded(
              child: FutureBuilder(
                   future: getData(),
                   builder: (BuildContext context, AsyncSnapshot snapshot) {
                     return (snapshot.data==null)?Center(child: CircularProgressIndicator()):
                     ListView.builder(
                       itemCount: snapshot.data.length,
                       itemBuilder: (BuildContext context, int index) {
                         return Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[
                           Card(
                             child:Container(
                               height: 60,
                               width: MediaQuery.of(context).size.width/1.07,
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children: <Widget>[
                                   Container(
                                     width:120,
                                     child:Text(snapshot.data[index].district,
                                     style: TextStyle(
                                       fontSize:20,
                                       fontWeight:FontWeight.bold
                                     ),
                                     )
                                   ),
                                    Container(
                                     color:Colors.cyan.withOpacity(0.4) ,
                                     width:65,
                                     child:Center(child: Text(snapshot.data[index].total.toString(),style: TextStyle(fontSize:16),))
                                   ),   
                                    Container(
                                      color: Colors.red.withOpacity(0.4),
                                     width:60,
                                     child:Center(child: Text(snapshot.data[index].new_cases.toString(),style: TextStyle(fontSize:16),))
                                   ),
                                 ],
                               ),
                               )
                           )
                         ],
                           );
                       },
                     );
                   },
                   
                 ),
        ),
        ]
      ),
    );
  }
}
class ApiData {
final String district;
 final int total;
 final int new_cases;
 ApiData(this.district,this.total,this.new_cases);
 
}
