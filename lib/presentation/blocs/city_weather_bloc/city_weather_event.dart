part of 'city_weather_bloc.dart';

@immutable
abstract class CityWeatherEvent {}
class CityEvent extends CityWeatherEvent {
  CityEvent();
}
