import 'dart:convert';

import 'package:flutter_app/Whether.dart';
import 'package:http/http.dart' as http;

class API {
  static Future<Weather> GetWhether(String lat, String lon) async {
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=minutely,alerts&umits=metric&appid=be5c8eb42a84243659e3e96864c62d8a"));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      Weather weather = new Weather();
      weather.current = Current.fromJson(json);
      List<WeatherToTime> Time= [];
      for(var a in json["hourly"]){
        Time.add(WeatherToTime.fromJson(a));
      }
      weather.time = Time;
      List<DayWeather> Day = [];
      for(var b in json["daily"]){
        Day.add(DayWeather.fromJson(b));
      }
      weather.week = Day;

      return weather;

    }
    else{
      throw Exception("Sosi");
    }
  }
}
