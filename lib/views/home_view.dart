// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp/views/search_view.dart';
import 'package:weatherapp/widgets/no_weather.dart';
import 'package:weatherapp/widgets/weather_info_body.dart';
class HomeView extends StatelessWidget {
 // const HomeView({super.key});

   const HomeView({super.key});
  //final WeatherModel weatherModel;
  @override
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
   // backgroundColor: ,
        title: const Text('Weather App',style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const SearchView();
              },));
            },
 
            icon: Icon(Icons.search,color: Colors.white,))],
      ),
      body: BlocBuilder<GetWeatherCubit,WeatherState>(
        builder: (context,state){  //state that come here represent the object in emit()
          //return const NoWeatherBody();
          if(state is NoWeatherState){
            return  NoWeatherBody();
          }
          else if(state is WeatherLoadState){
           // state.
            return WeatherInfoBody(
            // weatherModel: state.wea
            // therModel,
            weather: state.weatherModel,

            );
          }
          else{
            return  Text("Oops, there was an Error");
          }
        }
        
        
        )
        
        ,
    );
  }
}