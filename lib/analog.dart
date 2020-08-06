import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class AnaLog extends StatefulWidget {
  @override
  _AnaLogState createState() => _AnaLogState();
}

class _AnaLogState extends State<AnaLog> {
  var hour;
  var min;
  var type;
  @override
  void initState() {
    super.initState();
    timegetter();
  }
  Future timegetter()async {
   Future.delayed(const Duration(milliseconds: 500),(){
     setState(() {
        var hourformat=DateFormat('k');
        var hours=int.parse(hourformat.format(DateTime.now()));
        var hrformat=DateFormat('K');
         hour=int.parse(hrformat.format(DateTime.now()));
        var minformat=DateFormat('mm');
        min=int.parse(minformat.format(DateTime.now()));
         if(hours>12){
          hours=hours-12;
          type="PM";
        }
     });
     timegetter();
   });
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(hour.toString().padLeft(2,"0")+":"+min.toString().padLeft(2,"0")+" $type",style: TextStyle(fontSize: 45,color: Colors.black,))
      ],
    );
  }
}