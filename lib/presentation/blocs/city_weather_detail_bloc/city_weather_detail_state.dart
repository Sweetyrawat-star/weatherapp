import 'package:weatherapp/Data/models/city_weather_detail_model.dart';

abstract class CityWeatherDetailState {
  final WeatherOfCityDetailModel? cityWeatherEntity;
  CityWeatherDetailState(this.cityWeatherEntity);
}

class CityWeatherDetailInitial extends CityWeatherDetailState {
  CityWeatherDetailInitial(WeatherOfCityDetailModel placeHolderUserEntity)
      : super(placeHolderUserEntity);
}

class CityWeatherDetailProgress extends CityWeatherDetailState {
  CityWeatherDetailProgress(WeatherOfCityDetailModel? placeHolderUserEntity)
      : super(null);
}

class CityWeatherDetailSuccess extends CityWeatherDetailState {
  final WeatherOfCityDetailModel placeHolderUserEntity;

  CityWeatherDetailSuccess(this.placeHolderUserEntity)
      : super(placeHolderUserEntity);
}

class CityWeatherDetailFailed extends CityWeatherDetailState {
  final String? message;

  CityWeatherDetailFailed(this.message) : super(null);
}




