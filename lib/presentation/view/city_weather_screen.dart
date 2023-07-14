import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:weatherapp/common/constant/appColorConstant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/presentation/blocs/city_weather_bloc/city_weather_bloc.dart';
import 'package:weatherapp/presentation/view/city_detail_page.dart';
import '../../dependency_injection/get_it.dart';
import 'package:intl/intl.dart';

class AnimatedScrollableList extends StatefulWidget {
  const AnimatedScrollableList({super.key});

  @override
  _AnimatedScrollableListState createState() => _AnimatedScrollableListState();
}

class _AnimatedScrollableListState extends State<AnimatedScrollableList> {
  final List<String> items = List.generate(50, (index) => 'Item ${index + 1}');
  final double itemHeight = 100.0;
  List<bool> itemVisibility = [];

  late CityWeatherBloc _cityWeatherBloc;
  double kelvinToCelsius(double kelvin) {
    return kelvin - 273.15;
  }

  String displayWeatherImagePath(String key) {
    String weatherImagePath;

    switch (key) {
      case 'clouds':
        weatherImagePath = 'assets/weather_condition_icons/cloud.png';
        break;
      case 'rain':
        weatherImagePath = 'assets/weather_condition_icons/rainy.png';
        break;
      case 'mist':
        weatherImagePath = 'assets/weather_condition_icons/sunCloud.png';
        break;
      case 'smoke':
        weatherImagePath = 'assets/weather_condition_icons/windySunny.png';
        break;
      default:
        weatherImagePath = 'assets/weather_condition_icons/sunny.png';
    }
    return weatherImagePath;
  }

  @override
  void initState() {
    _cityWeatherBloc = appDi<CityWeatherBloc>();
    _cityWeatherBloc.add(CityEvent());
    super.initState();
    itemVisibility = List.generate(items.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: whiteColor,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: BlocProvider.value(
          value: _cityWeatherBloc,
          child: BlocConsumer<CityWeatherBloc, CityWeatherState>(
            listener: (context, state) {
              if (state is CityWeatherInitial) {
                const CircularProgressIndicator();
              }
              if (state is CityWeatherProgress) {
                const CircularProgressIndicator();
              }
              if (state is CityWeatherSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Data is loaded Sucessfully")));
              }
            },
            builder: (context, state) {
              if (state is CityWeatherInitial) {
                return const CircularProgressIndicator();
              }
              return ListView.separated(
                shrinkWrap: true,
                itemCount: state.cityWeatherEntity.length,
                separatorBuilder: (context, index) => const Divider(
                  height: 1.0,
                  color: greyColor,
                ),
                itemBuilder: (context, index) {
                  final DateTime now = DateTime.now();
                  final DateFormat timeFormat = DateFormat.jm();
                  final String formattedTime = timeFormat.format(now);
                  final celTemp =
                      kelvinToCelsius(state.cityWeatherEntity[index].main.temp);

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          SlidePageRoute(builder: (_) => WeatherScreen()));
                    },
                    child: VisibilityDetector(
                      key: Key('item_$index'),
                      onVisibilityChanged: (visibilityInfo) {
                        if (!itemVisibility[index] &&
                            visibilityInfo.visibleFraction == 1.0) {
                          setState(() {
                            itemVisibility[index] = true;
                          });
                        }
                      },
                      child: AnimatedOpacity(
                        opacity: itemVisibility[index] ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: AnimatedAlign(
                          alignment: itemVisibility[index]
                              ? Alignment.topCenter
                              : Alignment.bottomCenter,
                          duration: Duration(milliseconds: 500),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, right: 8, left: 8, bottom: 20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      state
                                          .cityWeatherEntity[index].sys.country,
                                      style: const TextStyle(
                                          color: greyDarkColor,
                                          fontWeight:
                                              FontWeight.w400, // For bold text
                                          fontFamily: 'Circle'),
                                    ),
                                    Text(
                                      formattedTime,
                                      style: const TextStyle(
                                          color: greyDarkColor,
                                          fontWeight:
                                              FontWeight.w400, // For bold text
                                          fontFamily: 'Circle'),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      state.cityWeatherEntity[index].name,
                                      style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight:
                                              FontWeight.bold, // For bold text
                                          fontFamily: 'Circle'),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${celTemp.toStringAsFixed(1)} °",
                                          style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight
                                                  .bold, // For bold text
                                              fontFamily: 'Circle'),
                                        ),
                                        const SizedBox(width: 5),
                                        Image.asset(
                                          displayWeatherImagePath(state
                                              .cityWeatherEntity[index]
                                              .weather
                                              .first
                                              .main
                                              .toLowerCase()),
                                          height: 20,
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
