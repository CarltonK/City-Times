import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:intl/intl.dart' as intl;

class WorldTime {

  String location;
  String time;
  String flag;
  String url;
  bool isDaytime;


  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {

    try {
      http.Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = convert.jsonDecode(response.body);
      //print(data);

      //get specific properties
      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      offset = offset.substring(1,3);
      //print('datetime: $datetime');
      //print('offset - $offset');

      //Create a datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //Ternary operator
      isDaytime = now.hour > 6 && now.hour < 19 ? true : false;
      time = intl.DateFormat.jm().format(now);

    }
    catch (e){
      print('caught error: $e');
      time = 'Kuna shida bro';
    }


  }

}


