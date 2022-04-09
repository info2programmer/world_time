import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
   String location; // Location name for the UI
   String flag; // url to an asset flag icon
   String url; // location url for api endpoint
   String time = ''; //the time in that location

  WorldTime({required this.location, required this.flag, required this.url});


  Future<void> getTime() async{
    try{
      Response resp = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(resp.body);

      // print(data);

      var utcOffset1 = data['utc_offset'].substring(1,3);
      var utcOffset2 = data['utc_offset'].substring(4,6);
      // print(utcOffset1);
      // print(utc_offset2);

      DateTime now = DateTime.parse(data['utc_datetime']);
      now =  now.add(Duration(hours: int.parse(utcOffset1), minutes: int.parse(utcOffset2)));
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print('Catch Error $e');
      time = "Could not get time data";
    }

  }
}