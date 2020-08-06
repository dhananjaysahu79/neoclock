import 'package:flutter/material.dart';
import 'package:neoclock/analog.dart';
import 'hands.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var dark_theme=false;
  themeChanger(){
    setState(() {
      print("called");
      dark_theme=!dark_theme;
    });
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarIconBrightness:Brightness.dark),
    child:Scaffold(
      backgroundColor: Colors.white,
      body: Column(
       mainAxisAlignment:MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: <Widget>[
       Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Stack(
             alignment: Alignment.center,
             children: <Widget>[
               Container(
                 height: height/2.4,
                 width: height/2.4,
                 decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   color: Color.fromARGB(255, 232, 237, 241),
                   boxShadow: [
                      BoxShadow(
                         color:Color.fromARGB(95, 159, 167, 188),
                         offset:Offset(30,-1),
                         blurRadius: 20.0,
                         spreadRadius: 1
                       )
                   ]
                 ),
               ),
               Container(
                 height: height/1.8,
                 width: height/1.8,
                 decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   image: DecorationImage(
                     image: AssetImage("Assets/Images/clock.png"),
                     fit: BoxFit.fitWidth
                     )
                 ),
               ),
               Container(
                 height: height/3.3,
                 width: height/3.3,
                 decoration: BoxDecoration(
                   color: Colors.white,
                   shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                         color:Colors.black.withOpacity(0.1),
                         offset:Offset(3,-1),
                         blurRadius: 10.0,
                       ),]

                 ),
               ),
               ClockHand(false)
             ],
           ),
         ],
       ),
       SizedBox(height: 50,),
       Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Icon(Icons.location_on,color: Color.fromARGB(255, 44, 197, 151),),
           SizedBox(width: 10,),
           Text("India",style: TextStyle(fontSize: 32,color: Color.fromARGB(255, 44, 197, 151)),),
         ],
       ),
       SizedBox(height: 20,),
       AnaLog(),
       SizedBox(height: 20,),
       ],
      ),
    )
    );
  }
}