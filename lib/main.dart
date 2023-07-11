import 'package:facebook/cubits/weater_cubit/weather_cubit.dart';
import 'package:facebook/providers/weather_provider.dart';
import 'package:facebook/screens/start_screen.dart';
import 'package:facebook/services/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'screens/home_page.dart';

void main() {
  runApp(BlocProvider(
      create: (context) {
        return WeatherCubit(WeatherService());
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: BlocProvider.of<WeatherCubit>(context).weatherModel == null
            ? Colors.blue
            : BlocProvider.of<WeatherCubit>(context)
                .weatherModel!
                .getThemeColor(),
      ),
      home: StartScreen(),
    );
  }
}
