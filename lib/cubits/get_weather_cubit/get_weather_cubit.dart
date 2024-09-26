import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_service.dart';


class GetWeatherCubit extends Cubit<WeatherState >{
  //GetWeatherCubit(super.initialState); //Incorrect Syntax
   WeatherModel? weatherModel;
 // GetWeatherCubit(super.NoWeatherState);
  GetWeatherCubit():super(NoWeatherState()); //Initializer List Syntax
  getWeather({required String cityName})async{

   try {
   weatherModel = await  WeatherService(Dio()).getCurrentWeather(cityName: cityName);
   emit(WeatherLoadState(weatherModel!));
} catch (e) {
  emit(WeatherFailureState());
}
  }
  // weatherModel => has the data
} 