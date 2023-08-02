import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location; // location name for the UI
   String time='';   //  the time in that location
  String flag;  //  url to an asset flag icon
   String url;  // location url for api endpoint
  bool isDayTime=true; // true if day and false if night
 
  WorldTime({required this.location,required this.flag,required this.url});

  Future<void> getTime() async{     // asynchronous code to get some data

       try{
         Response response=await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
         Map data=jsonDecode(response.body);

         String datetime = data['datetime'];
         DateTime now = DateTime.parse(datetime.substring(0,26));

         // Create Datetime object
         //   DateTime now=DateTime.parse(datetime);
         //   now.add(Duration(hours: int.parse(offset)));
       //  time=now.toString(); // set the time property
         isDayTime=now.hour>6&&now.hour<20;
         time=DateFormat.jm().format(now);
       }
       catch(e){
          print('Caught Error:$e');
          time='Could not get time data';
       }
    // // make the request
    // Response response=await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    // Map data=jsonDecode(response.body);
    //
    // String datetime = data['datetime'];
    // DateTime now = DateTime.parse(datetime.substring(0,26));
    //
    // // Create Datetime object
    // //   DateTime now=DateTime.parse(datetime);
    // //   now.add(Duration(hours: int.parse(offset)));
    //  time=now.toString(); // set the time property
  }
}

