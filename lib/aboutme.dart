import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
       appBar: AppBar(
      backgroundColor:Color.fromARGB(255, 29, 35, 41),
      title:AutoSizeText("ABOUT ME",
         minFontSize: 18,
         maxFontSize: 18,
         textScaleFactor: 0.8,
      )
    ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              width: screenWidth,
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0, bottom: 25.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SvgPicture.asset(
                        'Assets/Images/astronaut.svg',
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        height: screenWidth * 0.5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        left: 8.0,
                        right: 8.0,
                        bottom: 8.0,
                      ),
                      child: AutoSizeText(
                        "Dhananjay Sahu",
                         minFontSize: 27,
                         maxFontSize: 27,
                         textScaleFactor: 0.8,
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25.0,
                        right: 25.0,
                        bottom: 10.0,
                        top: 10.0,
                      ),
                      child: AutoSizeText(
                        "Android Developer | Flutter Developer",
                        textAlign: TextAlign.center,
                         minFontSize: 17,
                         maxFontSize: 17,
                         textScaleFactor: 0.8,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        bottom: 10.0,
                        left: 25.0,
                        right: 25.0,
                      ),
                      child: SizedBox(
                        height: 1.0,
                        child: Container(
                          color: Colors.black12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25.0,
                        right: 25.0,
                        bottom: 10.0,
                        top: 10.0,
                      ),
                      child: AutoSizeText(
                        'Follow me on',
                         minFontSize: 18,
                         maxFontSize: 18,
                         textScaleFactor: 0.8,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Color(0xFF3167A8),
                          wordSpacing: 2,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                        bottom: 10.0,
                        top: 5.0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () async {
                               if (await canLaunch("https://www.instagram.com/dhananjaysahu79/"))
                                 await launch('https://www.instagram.com/dhananjaysahu79/');
                                else
                                  throw "link not found";
                            },
                            child: SvgPicture.asset(
                              'Assets/Images/instagram.svg',
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                              height: screenWidth * 0.12,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async{
                              if (await canLaunch("https://www.linkedin.com/in/dhananjay-sahu-525b1b1a1/"))
                                await  launch('https://www.linkedin.com/in/dhananjay-sahu-525b1b1a1/');
                                else
                                  throw "link not found";
                            },
                            child: SvgPicture.asset(
                              'Assets/Images/linkedin.svg',
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                              height: screenWidth * 0.12,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async{
                               if (await canLaunch("https://github.com/dhananjaysahu79"))
                              launch('https://github.com/dhananjaysahu79');
                               else
                                  throw "link not found";
                            },
                            child: Container(
                              height: screenWidth * 0.12,
                              width: screenWidth * 0.12,
                              decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                              ),
                              child: Center(child: FaIcon(FontAwesomeIcons.github,color: Colors.white,size: screenWidth * 0.12,)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
