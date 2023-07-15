import 'package:weatherapp/Data/models/city_weather_detail_model.dart';

abstract class CityWeatherDetailState {

}

class CityWeatherDetailInitial extends CityWeatherDetailState {

}

class CityWeatherDetailProgress extends CityWeatherDetailState {

}

class CityWeatherDetailSuccess extends CityWeatherDetailState {
  final WeatherOfCityDetailModel cityWeatherEntity;

  CityWeatherDetailSuccess(this.cityWeatherEntity);

}

class CityWeatherDetailFailed extends CityWeatherDetailState {
  final String? message;

  CityWeatherDetailFailed(this.message);
}




