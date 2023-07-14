part of 'city_weather_bloc.dart';

@immutable
abstract class CityWeatherState {
  final List<ListElement> cityWeatherEntity;
  CityWeatherState(this.cityWeatherEntity);
}

class CityWeatherInitial extends CityWeatherState {
  CityWeatherInitial(List<ListElement> placeHolderUserEntity)
      : super(placeHolderUserEntity);
}

class CityWeatherProgress extends CityWeatherState {
  CityWeatherProgress(List<ListElement> placeHolderUserEntity)
      : super(placeHolderUserEntity);
}

class CityWeatherSuccess extends CityWeatherState {
  final List<ListElement> placeHolderUserEntity;

  CityWeatherSuccess(this.placeHolderUserEntity)
      : super(placeHolderUserEntity);
}

class CityWeatherFailed extends CityWeatherState {
  final String? message;

  CityWeatherFailed(this.message) : super([]);
}

