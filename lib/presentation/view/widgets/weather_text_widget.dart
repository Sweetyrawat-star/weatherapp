import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/common/constant/appColorConstant.dart';
import 'package:weatherapp/presentation/blocs/splash_text_bloc/splash_text_bloc.dart';
import 'package:weatherapp/presentation/view/city_weather_screen.dart';


class WeatherText extends StatefulWidget {
  @override
  State<WeatherText> createState() => _WeatherTextState();
}

class _WeatherTextState extends State<WeatherText> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashTextBloc()..add(StartTypingEvent()),
      child: BlocBuilder<SplashTextBloc, SplashTextState>(
        builder: (context, state) {
          String _displayText = '';
          double _initialFontSize = 24.0;
          double _finalFontSize = 46.0;
          double _topPosition = 42.0;
          double _leftPosition = 16.0;

          if (state is DisplayTextChanged) {
            _displayText = state.displayText;
          }

          return Stack(
            children: [
              AnimatedOpacity(
                opacity: _displayText.isNotEmpty ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: _leftPosition, top: _topPosition),
                  child: AnimatedDefaultTextStyle(
                    style: TextStyle(
                      fontSize: _displayText.isNotEmpty ? _finalFontSize : _initialFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      _displayText,
                      style: const TextStyle(color: greyDarkColor),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: AnimatedOpacity(
                  opacity: _displayText.isEmpty ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: _leftPosition, top: _topPosition, right: 16),
                    child: AnimatedDefaultTextStyle(
                      style: TextStyle(
                        fontSize: _displayText.isEmpty ? _finalFontSize : _initialFontSize,
                        color: splashTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                      duration: const Duration(milliseconds: 500),
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'today',
                                style: TextStyle(
                                  color: darkBlack,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add,
                                  size: 30,
                                  color: darkBlack,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Divider(color: greyColor),
                          const SizedBox(height: 20),
                          const AnimatedScrollableList(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
