import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:newsapp/indiadetail.dart';
import 'package:auto_size_text/auto_size_text.dart';
class IndiaData extends StatefulWidget {
  IndiaData({Key key}) : super(key: key);

  @override
  _IndiaDataState createState() => _IndiaDataState();
}

class _IndiaDataState extends State<IndiaData> {

  @override
  ApiData apiData;
  var decodedJson;
  var total_tested;
   Future<List<ApiData>> getData()async{
    var res = await http.get(Uri.encodeFull("https://api.covid19india.org/data.json"),
     
    );
    decodedJson = jsonDecode(res.body);
    
    List<ApiData> data =[];
    for(var  u in decodedJson["statewise"]){
      apiData =ApiData(
        u["state"],u["confirmed"],u["active"],u["recovered"],u["deaths"],
        u["deltaconfirmed"],u["deltadeaths"],u["deltarecovered"]
      );
      data.add(apiData);
    }
    int counter=0;
    for(var v in decodedJson["tested"]){
      counter++;
    }
    total_tested=decodedJson["tested"][counter-1]["totalsamplestested"];
    return data;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 18, 21, 23),
    appBar: AppBar(
      elevation: 0,
      backgroundColor:Color.fromARGB(255, 18, 21, 23),
      title:AutoSizeText("INDIA STATS",
       minFontSize: 18,
        maxFontSize: 18,
         textScaleFactor: 0.8,
            style: TextStyle(
              fontSize: 16,
              letterSpacing: 1
            ),
            )
    ),
    body: Column(
      children: <Widget>[
         Card(  
           color: Color.fromARGB(255, 29, 35, 41),
          child: Container(
             height: 35,
             child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                Container(
                    width:MediaQuery.of(context).size.width/3.2,
                   child:AutoSizeText("State",
                    minFontSize: 18,
                      maxFontSize: 18,
                      textScaleFactor: 0.8,
                   style: TextStyle(
                     fontSize:18,
                     fontWeight:FontWeight.bold
                    ),
                  )
                 ),
                  Container(
                        width:MediaQuery.of(context).size.width/3.5,
                        child:Center(child: AutoSizeText("Total",maxLines:1,
                         minFontSize: 18,
                      maxFontSize: 18,
                      textScaleFactor: 0.8,
                        style: TextStyle(fontSize:16,color:Colors.cyan),))
                        ),
                   Container(
                      width:MediaQuery.of(context).size.width/5,
                       child:Center(child: AutoSizeText("Deaths",maxLines:1,
                        minFontSize: 18,
                      maxFontSize: 18,
                      textScaleFactor: 0.8,
                       style: TextStyle(fontSize:16,color: Color.fromARGB(255, 194, 46, 65),),))
                  ),
                
                 ],
               ),
           ),
         ),
        Expanded(
              child: FutureBuilder(
                   future: getData(),
                   builder: (BuildContext context, AsyncSnapshot snapshot) {
                     return (snapshot.data==null)?Center(child: CircularProgressIndicator()):
                     ListView.builder(
                       itemCount: snapshot.data.length,
                       itemBuilder: (BuildContext context, int index) {
                         return InkWell(
                            onTap:()=>{
                         Navigator.of(context).push(
                           MaterialPageRoute<Null>(
                             builder:(BuildContext context){
                               return IndiaDetail(
                                 snapshot.data[index].state,
                                 snapshot.data[index].total,
                                 snapshot.data[index].active,
                                 snapshot.data[index].recovered,
                                 snapshot.data[index].death,
                                 snapshot.data[index].new_cases,
                                 snapshot.data[index].new_deaths,
                                 snapshot.data[index].deltarecovered,
                                 total_tested
                                 );
                        }))},
                             child: Row(
                             children: <Widget>[
                               Container(
                                 height: 60,
                                 width: MediaQuery.of(context).size.width/1.02,
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: <Widget>[
                                     Container(
                                      width:MediaQuery.of(context).size.width/3.2,
                                       child:AutoSizeText(snapshot.data[index].state,
                                        minFontSize: 18,
                                        maxFontSize: 18,
                                        textScaleFactor: 0.8,
                                       style: TextStyle(
                                         fontSize:18,
                                         fontWeight:FontWeight.bold
                                       ),
                                       )
                                     ),
                                      Container(
                                     
                                        width:MediaQuery.of(context).size.width/3.5,
                                       child:Center(child: AutoSizeText(snapshot.data[index].total.toString(),
                                        minFontSize: 16,
                                        maxFontSize: 16,
                                        textScaleFactor: 0.8,
                                       maxLines:1,style: TextStyle(fontSize:16,color:Colors.cyan),))
                                     ),
                                     
                                      Container(
                                        
                                       width:MediaQuery.of(context).size.width/5,
                                       child:Center(child: AutoSizeText(snapshot.data[index].death.toString(),
                                        minFontSize: 16,
                                        maxFontSize: 16,
                                        textScaleFactor: 0.8,
                                       maxLines:1,style: TextStyle(fontSize:16,color: Color.fromARGB(255, 194, 46, 65),),))
                                     ),
                                 
                                   ],
                                 ),
                                 )
                             ],
                           ),
                         );
                       },
                     );
                   },
                   
                 ),
        ),
      ],
    ),
    );
  }
}
class ApiData {
 final String state;
 final String total;
 final String active;
 final String recovered;
 final String death;
 final String new_cases;
 final String new_deaths;
 final String deltarecovered;

 ApiData(this.state,this.total,this.active,this.recovered,this.death,this.new_cases,this.new_deaths,this.deltarecovered);
 
}