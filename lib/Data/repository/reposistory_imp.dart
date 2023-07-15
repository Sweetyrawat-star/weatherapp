import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:weatherapp/Data/models/city_weather_detail_model.dart';
import 'package:weatherapp/Data/models/city_weather_model.dart';
import 'package:weatherapp/Domain/repository/repository.dart';
import 'package:weatherapp/Domain/usecase/city_weather_detail_usecase.dart';
import 'package:weatherapp/common/exceptions/app_error.dart';

import '../../common/exceptions/app_exception.dart';
import '../remote_source/remote_data_source.dart';

class PostUserReposistoryImpl implements PostUserReposistory{
  RemoteDataSource _remoteDataSource;
  PostUserReposistoryImpl(this._remoteDataSource);


  @override
  Future<Either<AppError, List<ListElement>>> getCityWeather() async {
    try{
      var _response = await _remoteDataSource.getCityWeather();
      return Right(_response);
    }on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on AppException catch (e) {
      return Left(AppError(AppErrorType.api, message: e.message));
    }
  }

  @override
  Future<Either<AppError, WeatherOfCityDetailModel>> getCityWeatherDetail(CityDataLatLong params) async {
    try {
      var _response = await _remoteDataSource.getCityWeatherDetail(params);
      return Right(_response);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on AppException catch (e) {
      return Left(AppError(AppErrorType.api, message: e.message));
    }
  }
}