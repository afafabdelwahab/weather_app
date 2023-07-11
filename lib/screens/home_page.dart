import 'package:facebook/cubits/weater_cubit/weather_cubit.dart';
import 'package:facebook/cubits/weater_cubit/weather_states.dart';
import 'package:facebook/models/weather_model.dart';
import 'package:facebook/providers/weather_provider.dart';
import 'package:facebook/screens/search_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable

class HomePage extends StatelessWidget {


  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage(

                );
              }));
            },
            icon: const Icon(Icons.search),
          )
        ],
        elevation: 0,
        title: const Text(
          'Weather',
        ),
      ),

      body: BlocBuilder<WeatherCubit,WeatherStates>(builder: (context,state){
        if(state is WeartherLoading){
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if(state is WeartherSuccess){
          weatherData=BlocProvider.of<WeatherCubit>(context).weatherModel;
          return SuccessBody(weatherData: weatherData);
        } else if (state is WeartherFailure){
          return Center(
            child: Text('something wrong please try again'),
          );
        }else{
             return DefaultBody();
        }



      },),

    );
  }
}

class SuccessBody extends StatelessWidget {
  const SuccessBody({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      weatherData!.getThemeColor(),
                      weatherData!.getThemeColor()[300]!,
                      weatherData!.getThemeColor()[100]!,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 3,
                    ),
                    Text(
                      BlocProvider.of<WeatherCubit>(context).cityName!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      weatherData!.date,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(weatherData!.getImage()),
                        Text(
                          '${weatherData!.tem.toInt()}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'maxTemp:${weatherData!.maxTem.toInt()}',
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'minTemp:${weatherData!.minTem.toInt()}',
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      weatherData!.condition,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(
                      flex: 5,
                    )
                  ],
                ),
              );
  }
}

class DefaultBody extends StatelessWidget {
  const DefaultBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.blue[400]!,
                      Colors.blue[300]!,
                      // Colors.blue[100]!,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'there is no weather 😔 start',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'searching now 🔍',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              );
  }
}
