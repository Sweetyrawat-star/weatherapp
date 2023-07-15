import 'package:weatherapp/Domain/usecase/city_weather_detail_usecase.dart';

class ApiConstant {
  static const String key = 'af232e5ca6994dd9df0799e6e786d1e8';
  static const String baseUrl = 'https://api.openweathermap.org';
  static const String weatherOfCityDetailUrl = "/data/2.5/weather?lat=35.0125&lon=34.0583&appid=$key";
  static const String weatherOfCity = "/data/2.5/group?id=18918,703448,1261481,1172451,14256,2643743&units;=metric&appid=$key";

  static  getParameter(CityDataLatLong params){
    return "/data/2.5/weather?${params.getLanLatString()}&appid=$key";

  }
}

