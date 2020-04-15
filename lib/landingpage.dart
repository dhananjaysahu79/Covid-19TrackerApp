import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:newsapp/detailpage.dart';
import 'package:newsapp/indiadata.dart';
import 'package:newsapp/safety.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'aboutme.dart';
class LandingPage extends StatefulWidget {
  LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
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
  var type="default";
  bool isActive=false;
  ApiData apiData;
  TextEditingController t1= new TextEditingController();
  @override
  void initState() { 
    totalCount();
    t1.addListener(search);
    t1.addListener(update);
    super.initState();
    
  }
  List<ApiData> data =[];
  List<ApiData> data2 =[];
  Future totalCount()async{
   var res = await http.get(Uri.encodeFull("https://coronavirus-monitor.p.rapidapi.com/coronavirus/worldstat.php"),
     headers: {
    "x-rapidapi-host": "coronavirus-monitor.p.rapidapi.com",
	  "x-rapidapi-key": "374bf8e1bbmsh07a727668901e27p1b0e0djsnb430e36160de"
       }
    );
   decodedJson2 = jsonDecode(res.body);
   setState(() {
     world_cases=decodedJson2["total_cases"];
   world_recovered=decodedJson2["total_recovered"];
   world_death=decodedJson2["total_deaths"];
   world_new_cases=decodedJson2["new_cases"];
   world_new_death_cases=decodedJson2["new_deaths"];
   world_active=int.parse(commaRemover(world_cases))-int.parse(commaRemover(world_recovered))-int.parse(commaRemover(world_death));
   });
  }
 
  Future<List<ApiData>> getData()async{
    var res = await http.get(Uri.encodeFull("https://coronavirus-monitor.p.rapidapi.com/coronavirus/cases_by_country.php"),
     headers: {
       "x-rapidapi-host": "coronavirus-monitor.p.rapidapi.com",
	     "x-rapidapi-key": "374bf8e1bbmsh07a727668901e27p1b0e0djsnb430e36160de"
       }
    );
    decodedJson = jsonDecode(res.body);
    data.clear();
    for(var  u in decodedJson["countries_stat"]){
      if(u["country_name"]!=""){
      apiData =ApiData(u["country_name"],u["cases"],u["active_cases"],u["total_recovered"],u["deaths"],
      u["new_cases"],u["new_deaths"],u["serious_critical"]
      );
      data.add(apiData);
      }
    }
      return data; 
  }
 
  commaRemover(String str){
   return str.replaceAll(",", "");
  } 

  var width1=0.0;
  var size1=1.0;
   int start=0;
  Future<List<ApiData>> search()async{
    List<ApiData> data2 =[];
       ApiData apidata;
       data2.clear();
       for (var u in data){
        try{
        if(t1.text!=""){
        if(u.country.toLowerCase().startsWith(t1.text.toLowerCase())){
          apidata=ApiData(u.country, u.total, u.active, u.recovered, u.death, u.new_cases, u.new_deaths, u.serious);
             data2.add(apidata); 
        }
        }
        }catch(_){  }
       } 
      return data2; 
  }
  update(){
    setState(() {
      
    });
  }
 
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child:Scaffold(
       resizeToAvoidBottomInset: false,
       backgroundColor: Color.fromARGB(255, 18, 21, 23),
        drawer:Drawer(
           child:Column( 
             children:<Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      alignment: Alignment.topLeft,
                      fit: BoxFit.fitHeight,
                      image: AssetImage("Assets/Images/active.jpg")
                      )
                  ),
                  ),
              ),
               ListTile(
                 leading:FaIcon(FontAwesomeIcons.globeEurope,color: Colors.white54,size: 17,),
                 title: AutoSizeText("WorldStats",
                  minFontSize: 15,
                  maxFontSize: 15,
                  textScaleFactor: 0.8,
                 ),
               ),
               
               ListTile(
                 leading:FaIcon(FontAwesomeIcons.home,color: Colors.white54,size: 17,),
                 title: AutoSizeText("India",
                  minFontSize: 15,
                  maxFontSize: 15,
                  textScaleFactor: 0.8,
                 ),
                enabled: true,
                onTap:()=>{
                   Navigator.of(context).push(
                    MaterialPageRoute<Null>(
                      builder:(BuildContext context){
                        return IndiaData();
                 }))},
                ),
                 ListTile(
                  leading:FaIcon(FontAwesomeIcons.medkit,color: Colors.white54,size: 17,),
                   title: AutoSizeText("Safety Measures",
                    minFontSize: 15,
                     maxFontSize: 15,
                      textScaleFactor: 0.8,
                  ),
                 onTap:()=>{
                     Navigator.of(context).push(
                     MaterialPageRoute<Null>(
                     builder:(BuildContext context){
                     return Safety();
                  }))},
               ),
              Divider(color:Colors.white12),
               ListTile(
                  leading:FaIcon(Icons.account_box,color: Colors.white54,size: 17,),
                   title: AutoSizeText("About Me",
                    minFontSize: 15,
                     maxFontSize: 15,
                      textScaleFactor: 0.8,
                  ),
                 onTap:()=>{
                     Navigator.of(context).push(
                     MaterialPageRoute<Null>(
                     builder:(BuildContext context){
                     return AboutMe();
                  }))},
               ),
               Expanded(
                 flex: 1,
                 child:Padding(padding: EdgeInsets.all(8))
                 ),
                 AutoSizeText("version 1.0.2",
                  minFontSize: 13,
                  maxFontSize: 13,
                  textScaleFactor: 0.8,
                 )
             ]
           ),
         ),
         
        appBar: AppBar(
         leading:isActive?Container():Builder(
           builder:(BuildContext context){
             return IconButton(
               icon: Icon(Icons.dashboard), 
                onPressed: ()=>Scaffold.of(context).openDrawer()
              );
             },
          ),
          actions: <Widget>[
            Stack(
             alignment: Alignment.center,
             children: <Widget>[
              (isActive)? Container(
              width: isActive?MediaQuery.of(context).size.width/1.2:0,
              child: TextField(
              controller: t1,   onSubmitted: null,        
              style: TextStyle(color: Colors.white54),
              decoration: InputDecoration(
              prefixIcon: Icon(Icons.search,color: Colors.white,),
              hintText: "Search Location..",
              labelStyle: TextStyle(color: Colors.white54),
              border: InputBorder.none,
              hintStyle: TextStyle(
              color: Colors.white54,
              fontSize: 18
              )
            ,),
            ),):Container(),
            ],
           ),
              Padding(
               padding: const EdgeInsets.only(right: 12),
               child: IconButton( icon: isActive?Icon(Icons.arrow_forward_ios,size:17):Icon(Icons.search), onPressed: () {
                 setState(() {
                 t1.clear();
                 isActive=isActive?false:true; 
                 type=(type=="default")?"mannual":"default";
                 });
               },),
             ),     
           ],
           elevation: 0,
          backgroundColor: Color.fromARGB(255, 18, 21, 23),
          title: AutoSizeText("WORLDSTATS",
            minFontSize: 18,
            maxFontSize: 18,
            textScaleFactor: 0.8,
          style: TextStyle(
            fontSize: 16,
            letterSpacing: 1
          ),
          ),
         ),
         body: Stack(
           children: <Widget>[
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
              Card(
               color: Color.fromARGB(255, 29, 35, 41),
               child: Container(
               height: 35,
               child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: <Widget>[
                  Container(
                     width:MediaQuery.of(context).size.width/3.2,
                     child:AutoSizeText("Country",
                      minFontSize: 18,
                      maxFontSize: 18,
                      textScaleFactor: 0.8,
                     style: TextStyle(
                       fontSize:18,
                       fontWeight:FontWeight.bold,
                      ),
                    )
                   ),
                    Container(
                         width:MediaQuery.of(context).size.width/3.5,
                          child:Center(child: AutoSizeText("Total",maxLines: 1,
                           minFontSize: 18,
                           maxFontSize: 18,
                           textScaleFactor: 0.8,
                          style: TextStyle(fontSize:16,color: Colors.cyan),))
                          ),
                    Container(
                       width:MediaQuery.of(context).size.width/5,
                         child:Center(child: AutoSizeText("Deaths",
                          minFontSize: 18,
                          maxFontSize: 18,
                          textScaleFactor: 0.8,
                         maxLines: 1,style: TextStyle(fontSize:16,color: Color.fromARGB(255, 194, 46, 65),),))
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
                      "WorldWide",
                       world_cases,world_active,world_recovered,world_death,world_new_cases,world_new_death_cases,""
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
                                   child:AutoSizeText("WorldWide",
                                    minFontSize: 18,
                                    maxFontSize: 18,
                                    textScaleFactor: 0.8,
                                   style: TextStyle(
                                     fontSize:18,
                                     fontWeight:FontWeight.bold,
                                     color: Colors.white54
                                   ),
                                   )
                                 ),
                                  Container(
                                  width:MediaQuery.of(context).size.width/3.5,
                                   child:Center(child: AutoSizeText(world_cases.toString(),
                                    minFontSize: 16,
                                    maxFontSize: 16,
                                    textScaleFactor: 0.8,
                                   maxLines:1,style: TextStyle(fontSize:16,color: Colors.cyan),))
                                 ),
                                  Container(
                                   width:MediaQuery.of(context).size.width/5,
                                   child:Center(child: AutoSizeText(world_death.toString(),
                                    minFontSize: 16,
                                    maxFontSize: 16,
                                    textScaleFactor: 0.8,
                                   maxLines:1,style: TextStyle(fontSize:16,color: Color.fromARGB(255, 194, 46, 65)),))
                                 ),
                               ],
                             ),
                             )
                         ],
                       ),
                      ),
                Expanded(
                 child: FutureBuilder(
                 future: type=="default"?getData():search(),
                 builder: (BuildContext context, AsyncSnapshot snapshot) {
                     return (snapshot.data==null)?Center(child:  type=="default"?CircularProgressIndicator():Text("No Data",style: TextStyle(color:Colors.white),),):
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
                                 child:AutoSizeText(snapshot.data[index].country,
                                  minFontSize: 18,
                                  maxFontSize: 18,
                                  textScaleFactor: 0.8,
                                 style: TextStyle(
                                   fontSize:18,
                                   fontWeight:FontWeight.bold,
                                   color: Colors.white54,
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
                                 maxLines:1,style: TextStyle(fontSize:16,color:Color.fromARGB(255, 194, 46, 65)),))
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
      )
      ],
     ),
    )
    );
  }
}
class ApiData {
  String country;
  String total;
  String active;
  String recovered;
  String death;
  String new_cases;
  String new_deaths;
  String serious;
 
 ApiData(this.country,this.total,this.active,this.recovered,this.death,this.new_cases,this.new_deaths,this.serious);
 
}