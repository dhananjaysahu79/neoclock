import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
class ClockHand extends StatefulWidget {
  var dark_theme;
  ClockHand(this.dark_theme);
  @override
  _ClockHandState createState() => _ClockHandState(dark_theme);
}

class _ClockHandState extends State<ClockHand> {
 @override
 var dark_theme;
 _ClockHandState(this.dark_theme);
 var hourdeg=0.0;
 var mindeg=0.0;
 var secdeg=0;

  void initState() {
    // TODO: implement initState
    super.initState();
    timegetter();
  }
 Future timegetter()async {
   Future.delayed(const Duration(milliseconds: 500),(){
   setState(() {
  var hourformat=DateFormat('kk');
  var hour=int.parse(hourformat.format(DateTime.now()));
  var minformat=DateFormat('mm');
  var min=int.parse(minformat.format(DateTime.now()));
  var secformat=DateFormat('ss');
  var sec=int.parse(secformat.format(DateTime.now()));
  secdeg=sec*6;
   hourdeg=(hour*30)+(min/2);
   mindeg=min*6+sec/10;

  });
  timegetter();
});


}


  @override
  Widget build(BuildContext context) {
    return Container(
       height: 350,
       width: 350,
       child: Stack(
         alignment:AlignmentDirectional.center,
         children: <Widget>[
            Column(
             mainAxisAlignment: MainAxisAlignment.start,
             children: <Widget>[
               Padding(
                 padding: const EdgeInsets.all(58.0),
               )
             ],
         ),
         //hour_hand
          SizedBox(
            child:Transform.rotate(
              angle: (3.14/180)*hourdeg,
              alignment: Alignment.center,
              child: Transform.translate(
                offset: Offset(0, -30),
                child: Container(
                height: 90,
                width: 4,
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(7.5),
                    color: Colors.black
                    )
                ),
                ),
           )
          ),

          //min_hand
          SizedBox(
            child:Transform.rotate(
              angle: (3.14/180)*mindeg,
              alignment: Alignment.center,
              child: Transform.translate(
                offset: Offset(0, -45),
                child: Container(
                height: 120,
                width: 3,
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(7.5),
                    color:Color.fromARGB(255, 159, 167, 188),
                    )
                ),
                ),
           )
          ),

          //sec_hand
          SizedBox(
            child:Transform.rotate(
              angle: (3.14/180)*secdeg,
              alignment: Alignment.center,
              child: Transform.translate(
                offset: Offset(0, -50),
                child: Container(
                height: 150,
                width: 3,
                  decoration:BoxDecoration(
                    color: Color.fromARGB(255, 44, 197, 151),
                    borderRadius: BorderRadius.circular(7.5),
                    )
                ),
                ),
           )
          ),


          //center_pin
           Container(
             height:12,
             decoration:BoxDecoration(
               color:Color.fromARGB(155, 232, 237, 241),
               shape:BoxShape.circle
             ),
             child: Padding(
               padding: const EdgeInsets.all(5.0),
               child: Container(
                 decoration: BoxDecoration(
                   color:Color.fromARGB(255, 44, 197, 151),
                   shape:BoxShape.circle
                 ),
               ),
             ),
           ),
         ],
       ),
    );
  }
}

