import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:newsapp/indiadetail.dart';
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
    print(counter);
    total_tested=decodedJson["tested"][counter-1]["totalsamplestested"];
    return data;
  }
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor:Colors.cyan,
      title:Text("India Stats")
    ),
    body: Column(
      children: <Widget>[
         Card(  
          child: Container(
             height: 35,
             child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
              Container(
                   width:122,
                   child:Text("State",
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
                    color: Colors.purple.withOpacity(0.3),
                      width:60,
                    child:Center(child: Text("Active",style: TextStyle(fontSize:16),))
                    ),
                     Container(
                       color:Colors.green.withOpacity(0.4),
                      width:60,
                      child:Center(child: Text("Re-\ncovered",style: TextStyle(fontSize:16),))
                     ),
                   Container(
                     color: Colors.red.withOpacity(0.4),
                      width:60,
                       child:Center(child: Text("Deaths",style: TextStyle(fontSize:16),))
                 ),
                 Container(
                      width:23,
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
                               Card(
                                 child:Container(
                                   height: 60,
                                   width: MediaQuery.of(context).size.width/1.02,
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                     children: <Widget>[
                                       Container(
                                         width:120,
                                         child:Text(snapshot.data[index].state,
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
                                          color:Colors.purple.withOpacity(0.3),
                                         width:60,
                                         child:Center(child: Text(snapshot.data[index].active.toString(),style: TextStyle(fontSize:16),))
                                       ),
                                        Container(
                                          color: Colors.green.withOpacity(0.4),
                                         width:60,
                                         child:Center(child: Text(snapshot.data[index].recovered.toString(),style: TextStyle(fontSize:16),))
                                       ),
                                        Container(
                                          color: Colors.red.withOpacity(0.4),
                                         width:60,
                                         child:Center(child: Text(snapshot.data[index].death.toString(),style: TextStyle(fontSize:16),))
                                       ),
                                      Icon(Icons.arrow_right,size:20)
                                     ],
                                   ),
                                   )
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