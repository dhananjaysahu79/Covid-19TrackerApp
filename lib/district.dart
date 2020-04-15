import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter/services.dart';
import 'package:auto_size_text/auto_size_text.dart';
class District extends StatelessWidget {
  var state;
  District(this.state);
  var decodedJson;
  ApiData apiData;
  @override
   
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
    return data;
  }
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
       child: Scaffold(
        backgroundColor: Color.fromARGB(255, 18, 21, 23),
         appBar: AppBar(
           backgroundColor: Color.fromARGB(255, 29, 35, 41),
           title: AutoSizeText(state+"'s Districts",
            minFontSize: 18,
            maxFontSize: 18,
            textScaleFactor: 0.8,
           ),
         ),
         body: Stack(
           children:<Widget>[
             Column(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: <Widget>[
                   Row(
                     children: <Widget>[
                      Image(image: AssetImage("Assets/Images/L1.png"))
                   ],)
                 ],
               ),
               Column(
                 children: <Widget>[
                   Expanded(
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
                           Container(
                             height: 60,
                             width: MediaQuery.of(context).size.width/1.07,
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: <Widget>[
                                 Container(
                                   width:MediaQuery.of(context).size.width/2.5,
                                   child:AutoSizeText(snapshot.data[index].district,
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
                                   width:MediaQuery.of(context).size.width/2,
                                   child:Row(
                                     children: <Widget>[
                                       AutoSizeText(snapshot.data[index].total.toString()+" ",
                                        minFontSize: 20,
                                        maxFontSize: 20,
                                        textScaleFactor: 0.8,
                                       style: TextStyle(fontSize:20,color: Colors.cyan),),
                                       (snapshot.data[index].new_cases==""||snapshot.data[index].new_cases==0)?Container():Icon(Icons.arrow_upward,color: Colors.cyan,size: 12,),
                                       (snapshot.data[index].new_cases==""||snapshot.data[index].new_cases==0)?Container():AutoSizeText(snapshot.data[index].new_cases.toString(),maxLines:1,
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
                           );
                       },
                     );
                   },
                   
                  ),
                  ),
                 ],
               )
           ]
         ),
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