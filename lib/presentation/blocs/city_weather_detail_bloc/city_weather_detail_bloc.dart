import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:weatherapp/Data/models/city_weather_detail_model.dart';
import 'package:weatherapp/Domain/usecase/city_weather_detail_usecase.dart';
import 'package:weatherapp/presentation/blocs/city_weather_detail_bloc/city_weather_detail_state.dart';
part 'city_weather_detail_event.dart';


class CityWeatherDetailBloc extends Bloc<WeatherDetailEvent, CityWeatherDetailState> {
  final CityWeatherDetailUseCase _cityWeatherDetailUseCase;
  CityWeatherDetailBloc(this._cityWeatherDetailUseCase) : super(CityWeatherDetailInitial(WeatherOfCityDetailModel())) {
    on<WeatherDetailEvent>((event, emit) async {
      if (event is FetchWeatherEvent) {
        emit(CityWeatherDetailProgress(null));
        var response = await _cityWeatherDetailUseCase(CityDataLatLong(event.lat,event.lon));
        response.fold(
              (l) => emit(CityWeatherDetailFailed(l.message)),
              (r) {
            if (r.name != null) {
              print(r);
              return emit(
                CityWeatherDetailSuccess(r),

              );
            } else {
              return emit(CityWeatherDetailSuccess(r));
            }
          },
        );
      }
    });
  }
}
