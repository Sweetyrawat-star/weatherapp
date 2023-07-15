
import 'package:get_it/get_it.dart';
import 'package:weatherapp/Data/remote_source/remote_data_source.dart';
import 'package:weatherapp/Data/repository/reposistory_imp.dart';
import 'package:weatherapp/Domain/repository/repository.dart';
import 'package:weatherapp/Domain/usecase/cityWeatherUseCase.dart';
import 'package:weatherapp/Domain/usecase/city_weather_detail_usecase.dart';
import 'package:weatherapp/common/services/dio_client.dart';
import 'package:weatherapp/presentation/blocs/city_weather_bloc/city_weather_bloc.dart';
import 'package:weatherapp/presentation/blocs/city_weather_detail_bloc/city_weather_detail_bloc.dart';
import 'package:weatherapp/presentation/blocs/splash_text_bloc/splash_text_bloc.dart';


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
  ///splash Bloc DI
  appDi.registerLazySingleton<SplashTextBloc>(
          () => SplashTextBloc());

  ///Bloc DI
  appDi.registerLazySingleton<CityWeatherBloc>(
          () => CityWeatherBloc(appDi()));

  ///UseCase DI
  appDi.registerLazySingleton<CityWeatherUseCase>(
          () => CityWeatherUseCase(appDi()));

  ///city weather detail Bloc DI
  appDi.registerLazySingleton<CityWeatherDetailBloc>(
          () => CityWeatherDetailBloc(appDi()));

  ///city weather detail UseCase DI
  appDi.registerLazySingleton<CityWeatherDetailUseCase>(
          () => CityWeatherDetailUseCase(appDi()));


}
