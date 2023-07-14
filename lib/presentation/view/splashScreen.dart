import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weatherapp/common/constant/appColorConstant.dart';
import 'package:weatherapp/presentation/view/city_weather_screen.dart';


class WeatherText extends StatefulWidget {
  @override
  _WeatherTextState createState() => _WeatherTextState();
}

class _WeatherTextState extends State<WeatherText> {
  String _displayText = '';
  late Timer _timer;
  static String todayText = 'today ?';
  final String _fullText = "What is the weather\n $todayText";

  final double _initialFontSize = 24.0;
  final double _finalFontSize = 46.0;
  final double _topPosition = 42.0;
  final double _leftPosition = 16.0;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTyping() {
    int currentIndex = 0;
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (currentIndex <= _fullText.length) {
        setState(() {
          _displayText = _fullText.substring(0, currentIndex);
          currentIndex++;
        });
      } else {
        timer.cancel();
        _timer = Timer(const Duration(milliseconds: 0), () {
          setState(() {
            _displayText = '';
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                fontSize:
                    _displayText.isNotEmpty ? _finalFontSize : _initialFontSize,
                fontWeight: FontWeight.bold,
              ),
              duration: const Duration(milliseconds: 500),
              child:
              Text(
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
                  fontSize:
                      _displayText.isEmpty ? _finalFontSize : _initialFontSize,
                  color: splashTextColor,
                  // fontSize: 24.0,
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
                            // fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                              size: 30,
                              color: darkBlack,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      color: greyColor,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AnimatedScrollableList()
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MyAppEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: WeatherText(),
      ),
    );
  }
}
