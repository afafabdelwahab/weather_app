import 'package:facebook/cubits/weater_cubit/weather_cubit.dart';
import 'package:facebook/providers/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../models/weather_model.dart';
import '../services/weather_service.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class SearchPage extends StatelessWidget {
  String? cityName;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        // backgroundColor: Color(0xfff6a01e),
        elevation: 0,
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            onSubmitted: (data) async {
              cityName = data;

             BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName!);
             BlocProvider.of<WeatherCubit>(context).cityName=cityName;
             Navigator.pop(context);
            },
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              hintText: 'Enter a City',
              hintStyle: TextStyle(color: Colors.white),
              suffixIcon: GestureDetector(
                onTap: () async {
                  WeatherService service = WeatherService();
                  WeatherModel? weather =
                      await service.getWeather(cityName: cityName!);
                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherData = weather;

                  Provider.of<WeatherProvider>(context, listen: false)
                      .cityName = cityName;

                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 35, horizontal: 16),
            ),
          ),
        ),
      ),
    );
  }
}

WeatherModel? weatherData;
