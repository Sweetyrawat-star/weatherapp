import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weatherapp/Data/models/city_weather_detail_model.dart';
import 'package:weatherapp/Domain/usecase/city_weather_detail_usecase.dart';
import 'package:weatherapp/Domain/usecase/usecase.dart';
import 'package:weatherapp/presentation/blocs/city_weather_detail_bloc/city_weather_detail_state.dart';
part 'city_weather_detail_event.dart';


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final CityWeatherDetailUseCase weatherService;

  WeatherBloc(this.weatherService) : super(WeatherInitialState());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeatherEvent) {
      yield WeatherLoadingState();
      try {
        final weather = await weatherService.call(NoParams());
        yield WeatherLoadedState(weather as WeatherOfCityDetailModel);
      } catch (error) {
        yield WeatherErrorState(error.toString());
      }
    }
  }
}