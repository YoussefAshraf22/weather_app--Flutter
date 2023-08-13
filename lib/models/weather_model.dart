import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;
  String weatherIcon;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName,
      required this.weatherIcon
      });

//Factory Named Constractour to git data form API directly
  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
   
    return WeatherModel(
      date: data['location']['localtime'],
      temp: jsonData['avgtemp_c'],
      maxTemp: jsonData['maxtemp_c'],
      minTemp: jsonData['mintemp_c'],
      weatherStateName: jsonData['condition']['text'],
      weatherIcon: jsonData['condition']['icon'],
    );
  }

  MaterialColor gitTeamColor(){
  if(weatherStateName == 'Sunny'||weatherStateName == 'Clear'){
    return Colors.orange;
  }if(weatherStateName=='Light Cloud'){
    return Colors.amber;
  }
  else if (weatherStateName == 'Sleet' || weatherStateName == 'Snow'||weatherStateName=='Hail') {
      return Colors.lightBlue;
    }else if (weatherStateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    }else if (weatherStateName == 'Light Rain' || weatherStateName == 'Heavy Rain'||weatherStateName=='Showers'||weatherStateName=='Patchy rain possible' ||weatherStateName=='Moderate Rain') {
      return Colors.blue;
    }else if (weatherStateName == 'Thunderstorm') {
      return  Colors.grey;
      }
  return Colors.teal;
}

}

