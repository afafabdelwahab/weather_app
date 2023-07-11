import 'package:facebook/cubits/weater_cubit/weather_states.dart';
import 'package:facebook/models/weather_model.dart';
import 'package:facebook/services/weather_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class WeatherCubit extends Cubit< WeatherStates>{
  WeatherCubit(this.weatherService) : super(WeartherInitial());
  WeatherService weatherService;
  String? cityName;
  WeatherModel? weatherModel;
  void getWeather({required String cityName})async{
    emit(WeartherLoading());
   try {
    weatherModel= await weatherService.getWeather(cityName: cityName);
      emit(WeartherSuccess());
   } on Exception catch (e) {
     emit(WeartherFailure());
   }



  }


}