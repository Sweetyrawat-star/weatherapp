import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/common/constant/appColorConstant.dart';
import 'package:weatherapp/dependency_injection/get_it.dart';
import 'package:weatherapp/presentation/blocs/city_weather_detail_bloc/city_weather_detail_bloc.dart';
import 'package:weatherapp/presentation/view/widgets/circularpogressbarIndicator.dart';
import 'package:weatherapp/presentation/view/widgets/temp_list.dart';

import '../../blocs/city_weather_detail_bloc/city_weather_detail_state.dart';

class WeatherDetailPageBody extends StatefulWidget {
  final String lat;
  final String long;
  const WeatherDetailPageBody({super.key, required this.lat, required this.long});

  @override
  State<WeatherDetailPageBody> createState() => _WeatherDetailPageBodyState();
}

class _WeatherDetailPageBodyState extends State<WeatherDetailPageBody> {
  late CityWeatherDetailBloc _weatherBloc;
  double kelvinToCelsius(double kelvin) {
    return kelvin - 273.15;
  }

  @override
  void initState() {
    _weatherBloc = appDi<CityWeatherDetailBloc>();
    _weatherBloc.add(FetchWeatherEvent(widget.lat,widget.long));

    super.initState();
  }
  // @override
  // void dispose() {
  //   _weatherBloc.close();
  //   // TODO: implement dispose
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
   return BlocProvider.value(
      value:  _weatherBloc,
      child: BlocConsumer<CityWeatherDetailBloc, CityWeatherDetailState>(
        listener: (context, state) {
          if (state is CityWeatherDetailInitial ) {
            const WeatherCircularProgressIndicator();
          }
          if (state is CityWeatherDetailProgress) {
            const WeatherCircularProgressIndicator();
          }
          if (state is CityWeatherDetailSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Data is loaded Sucessfully")));
          }
        },
        builder: (context, state) {
          if (state is CityWeatherDetailInitial ) {
            const WeatherCircularProgressIndicator();
          }
          if (state is CityWeatherDetailProgress) {
            const WeatherCircularProgressIndicator();
          }
          if (state is CityWeatherDetailSuccess) {
            // SchedulerBinding.instance.addPostFrameCallback((_) {
            //   ScaffoldMessenger.of(context).showSnackBar(
            //     const SnackBar(
            //       content: Text('Data is loaded Sucessfully'),
            //     ),
            //   );
            // });
            final celTemp =
            kelvinToCelsius(state.cityWeatherEntity.main?.temp?.toDouble() ??0.0);
            final celTempMax = (state.cityWeatherEntity.main?.tempMax?.toDouble()??0.0);
            final celTempMin = (state.cityWeatherEntity.main?.tempMin?.toDouble()??0.0);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.cityWeatherEntity.name.toString() ??"No name",
                  style: const TextStyle(
                      color: greyDarkColor,
                      fontWeight: FontWeight.w400, // For bold text
                      fontFamily: 'Circle'),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            celTemp.toStringAsFixed(1),
                            style: const TextStyle(fontSize: 100),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 50.0),
                              child: Image.asset(
                                'assets/weather_condition_icons/sunCloud.png',
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 60.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    state.cityWeatherEntity.weather?[0].main.toString()??"Cool",
                                    style:
                                    const TextStyle(fontSize: 17, color: greyDarkColor),
                                  ),
                                ),
                                const Spacer(),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: [
                                      const Text(
                                        'feel like ',
                                        style: TextStyle(
                                            fontSize: 17, color: greyDarkColor),
                                      ),
                                      Text(
                                        "${celTemp.toStringAsFixed(1)} °",
                                        style:
                                        const TextStyle(fontSize: 17, color: darkBlack),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  color: greyColor,
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              // Handle back button action
                            },
                            icon: const Icon(Icons.arrow_upward_sharp),
                          ),
                          Text(
                            "${celTempMax.toStringAsFixed(1)} °",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              // Handle back button action
                            },
                            icon: const Icon(Icons.arrow_downward),
                          ),
                          Text(
                            "${celTempMin.toStringAsFixed(1)}°",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child:  SizedBox(
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'humidity',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Text(
                              state.cityWeatherEntity.main?.humidity.toString() ?? "10",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                         SizedBox(
                          width: 150,
                          child: Row(
                            children: [
                              const Text(
                                'wind',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Text(
                                "${state.cityWeatherEntity.wind.toString()} m/s" ?? "3 m/s",
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child:  SizedBox(
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Text(
                              'uv index',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              '2',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 150,
                          child: Row(
                            children: [
                              const Text(
                                'pressure',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                               "${state.cityWeatherEntity.main?.pressure.toString()}" ?? "10mmHg",
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  color: greyColor,
                ),
                const SizedBox(
                  height: 30,
                ),
                HorizontalListScreen(),
              ],
            );
          }
           if (state is CityWeatherDetailFailed) {
            return const Column(
              children: [
                Center(child: Text("Data not available")),
              ],
            );
          }else{
             return Container();
           }


        },
      ),
    );

  }
}
