
import 'package:dartz/dartz.dart';
import 'package:weatherapp/Data/models/city_weather_detail_model.dart';
import 'package:weatherapp/Domain/repository/repository.dart';
import 'package:weatherapp/Domain/usecase/usecase.dart';

import '../../common/exceptions/app_error.dart';

class CityWeatherDetailUseCase extends UseCase<WeatherOfCityDetailModel, NoParams> {
  final  PostUserReposistory _repo;

  CityWeatherDetailUseCase(this._repo);

  @override
  Future<Either<AppError, WeatherOfCityDetailModel>> call(NoParams params) async {
    return _repo.getCityWeatherDetail();
  }
}
