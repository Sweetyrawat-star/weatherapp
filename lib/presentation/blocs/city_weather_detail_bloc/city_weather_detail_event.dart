part of 'city_weather_detail_bloc.dart';

abstract class WeatherDetailEvent {}

class FetchWeatherEvent extends WeatherDetailEvent  {
  final String lon;
  final String lat;
  FetchWeatherEvent(this.lon,this.lat);
}