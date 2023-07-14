
import 'package:get_it/get_it.dart';
import 'package:weatherapp/Data/remote_source/remote_data_source.dart';
import 'package:weatherapp/Data/repository/reposistory_imp.dart';
import 'package:weatherapp/Domain/repository/repository.dart';
import 'package:weatherapp/Domain/usecase/cityWeatherUseCase.dart';
import 'package:weatherapp/common/services/dio_client.dart';
import 'package:weatherapp/presentation/blocs/city_weather_bloc/city_weather_bloc.dart';


import '../common/services/DioServices.dart';

final appDi = GetIt.instance;

void initDi() async {
  /// Api Client DI
  appDi.registerSingleton<DioClient>(DioClient());

  ///Remote Data Source DI
  appDi.registerLazySingleton<RemoteDataSource>(
          () => RemoteDataSourceImpl(appDi()));

  ///Repo DI
  appDi.registerLazySingleton<PostUserReposistory>(
          () => PostUserReposistoryImpl(appDi()));

  ///Bloc DI
  appDi.registerLazySingleton<CityWeatherBloc>(
          () => CityWeatherBloc(appDi()));

  ///UseCase DI
  appDi.registerLazySingleton<CityWeatherUseCase>(
          () => CityWeatherUseCase(appDi()));

}
