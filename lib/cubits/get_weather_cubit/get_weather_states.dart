import 'package:weatherapp/models/weather_model.dart';

class WeatherState {
  
}


class NoWeatherState extends WeatherState{
  
}

class WeatherLoadState extends WeatherState{
  final WeatherModel weatherModel;

  WeatherLoadState(this.weatherModel);
}

class WeatherFailureState extends WeatherState{
  
}