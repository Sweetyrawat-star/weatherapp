import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weatherapp/Data/models/city_weather_model.dart';
import 'package:weatherapp/Domain/usecase/cityWeatherUseCase.dart';
import 'package:weatherapp/Domain/usecase/usecase.dart';

part 'city_weather_event.dart';
part 'city_weather_state.dart';

class CityWeatherBloc extends Bloc<CityWeatherEvent, CityWeatherState> {
  final CityWeatherUseCase _cityWeatherUseCase;
  CityWeatherBloc(this._cityWeatherUseCase) : super(CityWeatherInitial([])) {
    on<CityWeatherEvent>((event, emit) async {
      if (event is CityEvent) {
        emit(CityWeatherProgress([]));
        var response = await _cityWeatherUseCase(NoParams());
        response.fold(
              (l) => emit(CityWeatherFailed(l.message)),
              (r) {
            if (r.first.name != null) {
              return emit(
                CityWeatherSuccess(r),
              );
            } else {
              return emit(CityWeatherSuccess([]));
            }
          },
        );
      }
    });
  }
}
