import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double tem;
  double maxTem;
  double minTem;
  String condition;

  WeatherModel(
      {required this.date,
      required this.tem,
      required this.maxTem,
      required this.minTem,
      required this.condition});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: data['location']['localtime'],
        tem: jsonData['avgtemp_c'],
        maxTem: jsonData['maxtemp_c'],
        minTem: jsonData['mintemp_c'],
        condition: jsonData['condition']['text']);
  }

  String getImage() {
    if (condition == 'Snow' || condition == 'Hail') {
      return 'images/snow.png';
    } else if (condition == 'Clear' || condition == 'Light Cloud') {
      return 'images/clear.png';
    } else if (condition == 'Thunderstorm' || condition == 'Thunder') {
      return 'images/thunderstorm.png';
    } else if (condition == 'Heavy Cloud' ||
        condition == 'Overcast' ||
        condition == 'Partly cloudy') {
      return 'images/cloudy.png';
    } else if (condition == 'Heavy Rain' ||
        condition == 'Light Rain' ||
        condition == 'Moderate rain' ||
        condition == 'Patchy rain possible') {
      return 'images/rainy.png';
    } else {
      return 'images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (condition == 'Snow' || condition == 'Hail') {
      return Colors.blue;
    } else if (condition == 'Clear' ||
        condition == 'Light Cloud' ||
        condition == 'Sunny') {
      return Colors.blue;
    } else if (condition == 'Thunderstorm' || condition == 'Thunder') {
      return Colors.blue;
    } else if (condition == 'Heavy Cloud') {
      return Colors.blue;
    } else if (condition == 'Heavy Rain' ||
        condition == 'Light Rain' ||
        condition == 'Moderate rain' ||
        condition == 'Patchy rain possible') {
      return Colors.blue;
    } else {
      return Colors.blue;
    }
  }

  @override
  String toString() {
    return 'date=$date  temp=$tem  maxTemp=$maxTem  minTemp=$minTem';
  }
}
