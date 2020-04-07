import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:newsapp/detailpage.dart';
import 'package:newsapp/indiadata.dart';
import 'package:newsapp/safety.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CovidData extends StatefulWidget {
  CovidData({Key key}) : super(key: key);

  @override
  _CovidDataState createState() => _CovidDataState();
}

class _CovidDataState extends State<CovidData> {
  @override
  var decodedJson;
  var decodedJson2;
  var country;
  var world_cases;
  var world_recovered;
  var world_death;
  var world_active;
  var world_new_cases;
  var world_new_death_cases;
  ApiData apiData;
  @override
  void initState() { 
    totalCount();
    super.initState();
    
  }
  Future totalCount()async{
   var res = await http.get(Uri.encodeFull("https://coronavirus-monitor.p.rapidapi.com/coronavirus/worldstat.php"),
     headers: {
    "x-rapidapi-host": "coronavirus-monitor.p.rapidapi.com",
	  
       }
    );
    decodedJson2 = jsonDecode(res.body);
   setState(() {
   world_cases=decodedJson2["total_cases"];
   world_recovered=decodedJson2["total_recovered"];
   world_death=decodedJson2["total_deaths"];
   print(world_death);
   world_new_cases=decodedJson2["new_cases"];
   world_new_death_cases=decodedJson2["new_deaths"];
   world_active=int.parse(commaRemover(world_cases))-int.parse(commaRemover(world_recovered))-int.parse(commaRemover(world_death));
   });
  }
  Future<List<ApiData>> getData()async{
    var res = await http.get(Uri.encodeFull("https://coronavirus-monitor.p.rapidapi.com/coronavirus/cases_by_country.php"),
     headers: {
       "x-rapidapi-host": "coronavirus-monitor.p.rapidapi.com",
	     
       }
    );
    decodedJson = jsonDecode(res.body);
    List<ApiData> data =[];
    for(var  u in decodedJson["countries_stat"]){
      apiData =ApiData(u["country_name"],u["cases"],u["active_cases"],u["total_recovered"],u["deaths"],
      u["new_cases"],u["new_deaths"],u["serious_critical"]
      );
      data.add(apiData);
    }
    return data;
  }
  
  commaRemover(String str){
   return str.replaceAll(",", "");
  }
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        
        title: Text("WorldStats")
      ),
      drawer: Drawer(
        child: Column(
         
          children:<Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration:BoxDecoration(
                  image:DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage("Assets/Images/index.png"))
                )
              )
              ),
            ListTile(
              leading:FaIcon(FontAwesomeIcons.globeEurope),
              title: Text("WorldStats"),
            ),
            ListTile(
              leading:FaIcon(FontAwesomeIcons.home),
              title: Text("India"),
              enabled: true,
             onTap:()=>{
              Navigator.of(context).push(
              MaterialPageRoute<Null>(
              builder:(BuildContext context){
                  return IndiaData();
             }))},
            ),
              ListTile(
              leading:FaIcon(FontAwesomeIcons.hospitalUser),
              title: Text("Safety Measures"),
              onTap:()=>{
                  Navigator.of(context).push(
                  MaterialPageRoute<Null>(
                  builder:(BuildContext context){
                  return Safety();
               }))},
            ),
           
            Expanded(
              flex: 1,
              child:Padding(padding: EdgeInsets.all(8))
              ),
              Text("version 1.0.1")
          ]
        ),
      ),
     body:Column(
       children: <Widget>[
          Card(  
          child: Container(
             height: 35,
             child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
              Container(
                   width:122,
                   child:Text("Country",
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
         
         InkWell(
           onTap:()=>{
                         Navigator.of(context).push(
                           MaterialPageRoute<Null>(
                             builder:(BuildContext context){
                               return DetailPage(
                                 "WorldWide","","","","","","","",
                                 world_cases,world_active,world_recovered,world_death,world_new_cases,world_new_death_cases
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
                                     child:Text("WorldWide",
                                     style: TextStyle(
                                       fontSize:20,
                                       fontWeight:FontWeight.bold
                                     ),
                                     )
                                   ),
                                    Container(
                                     color:Colors.cyan.withOpacity(0.4) ,
                                     width:65,
                                     child:Center(child: Text(world_cases.toString(),style: TextStyle(fontSize:16),))
                                   ),
                                    Container(
                                      color:Colors.purple.withOpacity(0.3),
                                     width:60,
                                     child:Center(child: Text(world_active.toString(),style: TextStyle(fontSize:16),))
                                   ),
                                    Container(
                                      color: Colors.green.withOpacity(0.4),
                                     width:60,
                                     child:Center(child: Text(world_recovered.toString(),style: TextStyle(fontSize:16),))
                                   ),
                                    Container(
                                      color: Colors.red.withOpacity(0.4),
                                     width:60,
                                     child:Center(child: Text(world_death.toString(),style: TextStyle(fontSize:16),))
                                   ),
                                  Icon(Icons.arrow_right,size:20)
                                 ],
                               ),
                               )
                           )
                         ],
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
                               return DetailPage(
                                 snapshot.data[index].country,
                                 snapshot.data[index].total,
                                 snapshot.data[index].active,
                                 snapshot.data[index].recovered,
                                 snapshot.data[index].death,
                                 snapshot.data[index].new_cases,
                                 snapshot.data[index].new_deaths,
                                 snapshot.data[index].serious,
                                 world_cases,world_active,world_recovered,world_death,world_new_cases,world_new_death_cases
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
                                   child:Text(snapshot.data[index].country,
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
     )
    );
  }
}
class ApiData {
 final String country;
 final String total;
 final String active;
 final String recovered;
 final String death;
 final String new_cases;
 final String new_deaths;
 final String serious;
 //final String body;
 ApiData(this.country,this.total,this.active,this.recovered,this.death,this.new_cases,this.new_deaths,this.serious);
 
}
