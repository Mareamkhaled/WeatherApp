import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     resizeToAvoidBottomInset: false,
      appBar: AppBar(
        
    // backgroundColor: const Color(0xff2C9CEE),
        //elevation: 0,
        title: const Text("Search a city",style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),),
      ),
      body: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
           onSubmitted: (value)async{
           BlocProvider.of<GetWeatherCubit>(context).getWeather(cityName: value);

            // log(weatherModel!.cityName);
             Navigator.pop(context);
           },
            decoration: const InputDecoration(
              hintText: "Enter City Name"
              ,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,vertical: 32
              ),
              labelText: "Search",
              suffixIcon: Icon(Icons.search),
              suffixIconColor:  Color.fromARGB(255, 47, 35, 209),
              // hintStyle: TextStyle(),
              border: OutlineInputBorder(
                
               // borderRadius: BorderRadius.circular(16),
                borderSide:  BorderSide(
                  color: Colors.green
                )
              ),
              // enabledBorder: OutlineInputBorder(
              //   borderSide: BorderSide(color: Colors.green)
              // ),

              // focusedBorder: OutlineInputBorder(
              //   borderSide: BorderSide(color: Color.fromARGB(255, 202, 12, 56))
              // ),
            )
        ),
             ),
      ) );
  }
}

