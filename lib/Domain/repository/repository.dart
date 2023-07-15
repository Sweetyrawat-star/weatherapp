
import 'package:dartz/dartz.dart';
import 'package:weatherapp/Data/models/city_weather_model.dart';
import 'package:weatherapp/Domain/usecase/city_weather_detail_usecase.dart';
import 'package:weatherapp/common/exceptions/app_error.dart';

import '../../Data/models/city_weather_detail_model.dart';


abstract class PostUserReposistory{
  Future<Either<AppError, List<ListElement>>> getCityWeather();
  Future<Either<AppError, WeatherOfCityDetailModel>> getCityWeatherDetail(CityDataLatLong params);

}