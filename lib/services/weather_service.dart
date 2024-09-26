//import 'dart:developer';

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherService {
final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey ='80b0f3a91473407aaf654158241209';
  WeatherService(this.dio);
Future<WeatherModel> getCurrentWeather({required String cityName})async{
  
  Response response= await dio
      .get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");
  
       try {
  WeatherModel weatherModel = WeatherModel.fromJson(response.data);
  return weatherModel;
} on DioException catch (e) {
  final String errorMsg = e.response?.data['error']['message']??"opps there was an error, try again";
  throw Exception(errorMsg);
  //return errorMsg;
 } 
catch(e){
  log(e.toString());
  throw Exception("ERROR, try later");
}
    
  // else{
  //   final String errorMsg = response.data['error']['message'];
  //   throw Exception(errorMsg);
  // }
  // response.data => this is the data that appear in google when i put the URL

  

// catch (e) {
//   return null; //there were an error on null because A value of type 'Null' can't be returned from the method 'getCurrentWeather' because it has a return type of 'Future<WeatherModel>' so i but ? Future<WeatherModel?>
//   
// }
} 

   
   
}