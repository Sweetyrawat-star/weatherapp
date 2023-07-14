

import 'package:dartz/dartz.dart';
import 'package:weatherapp/Data/models/city_weather_model.dart';
import 'package:weatherapp/Domain/repository/repository.dart';
import 'package:weatherapp/Domain/usecase/usecase.dart';

import '../../common/exceptions/app_error.dart';

class CityWeatherUseCase extends UseCase<List<ListElement>, NoParams> {
  final  PostUserReposistory _repo;

  CityWeatherUseCase(this._repo);

  @override
  Future<Either<AppError, List<ListElement>>> call(NoParams params) async {
    return _repo.getCityWeather();
  }
}
