import 'dart:convert';

import 'package:facebook/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
    try {
      Uri url = Uri.parse(
          'http://api.weatherapi.com/v1/forecast.json?key=4f4d81bfcc4844d7bf8215833222309&q=$cityName&days=1&aqi=no&alerts=no');
      http.Response response = await http.get(url);

      Map<String, dynamic> data = jsonDecode(response.body);

      weather = WeatherModel.fromJson(data);
    } catch (ex) {
      print(ex);
    }
    return weather;
  }
}
