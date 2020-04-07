import 'package:flutter/material.dart';
class Safety extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor:Colors.cyan,
      title:Text("Safety Measures")
    ),
    body: SingleChildScrollView(
      child:Column(
        children: <Widget>[
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("How To Greet",
            style: TextStyle(fontSize:22),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network("https://www.who.int/images/default-source/health-topics/coronavirus/risk-communications/general-public/safe-greetings.tmb-1920v.png?sfvrsn=2e97004e_4"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network("https://www.who.int/images/default-source/health-topics/coronavirus/risk-communications/general-public/handshaking.tmb-1920v.png?sfvrsn=4aed53c5_4"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network("https://www.who.int/images/default-source/health-topics/coronavirus/risk-communications/general-public/wearing-gloves.tmb-1920v.png?sfvrsn=ec69b46a_4"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network("https://www.who.int/images/default-source/health-topics/coronavirus/social-media-squares/be-ready-social-3.tmb-1920v.jpg?sfvrsn=1706a18f_24"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network("https://www.who.int/images/default-source/health-topics/coronavirus/social-media-squares/be-ready-social-2.tmb-1920v.jpg?sfvrsn=28a6f92d_4"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network("https://www.who.int/images/default-source/health-topics/coronavirus/social-media-squares/be-ready-social-1.tmb-1920v.jpg?sfvrsn=c81745a7_4"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network("https://www.who.int/images/default-source/health-topics/coronavirus/social-media-squares/be-smart-if-you-develop.tmb-1920v.jpg?sfvrsn=1486258a_21"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network("https://www.who.int/images/default-source/health-topics/coronavirus/social-media-squares/be-smart-inform.tmb-479v.jpg?sfvrsn=f6dbe358_24"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network("https://www.who.int/images/default-source/health-topics/coronavirus/social-media-squares/be-safe.tmb-479v.jpg?sfvrsn=1f6e4aef_24"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network("https://www.who.int/images/default-source/health-topics/coronavirus/social-media-squares/be-kind-to-support.tmb-479v.jpg?sfvrsn=1856f2a3_25"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Save Yourself and others from getting sick",
            style: TextStyle(fontSize:22),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network("https://www.who.int/images/default-source/health-topics/coronavirus/risk-communications/general-public/protect-yourself/blue-1.tmb-479v.png?sfvrsn=3d15aa1c_4"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network("https://www.who.int/images/default-source/health-topics/coronavirus/risk-communications/general-public/protect-yourself/blue-2.tmb-479v.png?sfvrsn=2bc43de1_4"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network("https://www.who.int/images/default-source/health-topics/coronavirus/risk-communications/general-public/protect-yourself/blue-3.tmb-479v.png?sfvrsn=b1ef6d45_4"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network("https://www.who.int/images/default-source/health-topics/coronavirus/risk-communications/general-public/protect-yourself/blue-4.tmb-479v.png?sfvrsn=a5317377_14"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Covid 19 Home Care",
            style: TextStyle(fontSize:22),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network("https://www.who.int/images/default-source/health-topics/coronavirus/risk-communications/home-care-posters/home-care-ill-people-a4-covid.tmb-1920v.png?sfvrsn=71718c4b_4"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network("https://www.who.int/images/default-source/health-topics/coronavirus/risk-communications/home-care-posters/home-care-everyone-a4-covid.tmb-1920v.png?sfvrsn=29ba54d8_4"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network("https://www.who.int/images/default-source/health-topics/coronavirus/risk-communications/home-care-posters/home-care-caregivers-a4-covid.tmb-1920v.png?sfvrsn=8c412ecd_4"),
          ),
         
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(" How to cope with stress during 2019-nCoV outbreak",
            style: TextStyle(fontSize:22),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network("https://www.who.int/images/default-source/health-topics/coronavirus/risk-communications/general-public/stress/stress.tmb-1920v.jpg?sfvrsn=b8974505_17"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network("https://www.who.int/images/default-source/health-topics/coronavirus/risk-communications/general-public/stress/children-stress.tmb-1920v.jpg?sfvrsn=343355fd_4"),
          )
        ],
      ),
    ),
    );
  }
}