
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weatherapp/Data/models/city_weather_detail_model.dart';
import 'package:weatherapp/Data/models/city_weather_model.dart';
import 'package:weatherapp/Data/models/user_model.dart';
import 'package:weatherapp/Domain/usecase/city_weather_detail_usecase.dart';
import 'package:weatherapp/common/constant/ApiConstant.dart';
import 'package:weatherapp/common/services/dio_client.dart';

abstract class RemoteDataSource {
  Future<List<ListElement>> getCityWeather();
  Future<WeatherOfCityDetailModel> getCityWeatherDetail(CityDataLatLong params);
}

class RemoteDataSourceImpl implements RemoteDataSource{
  final DioClient _dioClient;

  RemoteDataSourceImpl(this._dioClient);


  Future<List<ListElement>> getCityWeather() async {
    final Response _response = await _dioClient.getRequest(endpoint: ApiConstant.weatherOfCity);
    List<ListElement> _data = [];
    if (_response.statusCode == 200 || _response.statusCode == 201) {
      Map<String, dynamic> responseData = _response.data as Map<String, dynamic>;
      List<dynamic> data = responseData['list'] as List<dynamic>;
      for (var listData in data) {
        _data.add(ListElement.fromJson(listData));
      }
      return _data;
    } else {
      throw Exception(_response.statusMessage);
    }
  }
  Future<WeatherOfCityDetailModel> getCityWeatherDetail(CityDataLatLong params) async {
    final Response _response = await _dioClient.getRequest(endpoint: ApiConstant.weatherOfCityDetailUrl);
    if (_response.statusCode == 200 || _response.statusCode == 201) {
      //final Map<String,dynamic> jsonMap = (json.decode(_response.data.toString())) as Map<String,dynamic>;
      final dynamicData = _response.data as Map<String,dynamic>;
      print(dynamicData);
      final weatherOfCityDetailModel = WeatherOfCityDetailModel.fromJson(dynamicData);
      return weatherOfCityDetailModel;
    } else {
      throw Exception(_response.statusMessage);
    }
  }


}