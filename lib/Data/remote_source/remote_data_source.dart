
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weatherapp/Data/models/city_weather_detail_model.dart';
import 'package:weatherapp/Data/models/city_weather_model.dart';
import 'package:weatherapp/Data/models/user_model.dart';
import 'package:weatherapp/common/constant/ApiConstant.dart';
import 'package:weatherapp/common/services/dio_client.dart';

abstract class RemoteDataSource {
  Future<List<ListElement>> getCityWeather();
  Future<WeatherOfCityDetailModel> getCityWeatherDetail();
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
  Future<WeatherOfCityDetailModel> getCityWeatherDetail() async {
    final Response _response = await _dioClient.getRequest(endpoint: ApiConstant.weatherOfCityDetailUrl);
    if (_response.statusCode == 200 || _response.statusCode == 201) {
      final jsonMap = json.decode(_response.data);
      final weatherOfCityDetailModel = WeatherOfCityDetailModel.fromJson(jsonMap);
      return weatherOfCityDetailModel;
    } else {
      throw Exception(_response.statusMessage);
    }
  }


}