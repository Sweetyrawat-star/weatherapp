
import 'package:flutter/material.dart';
import 'package:weatherapp/common/constant/appColorConstant.dart';
import 'package:weatherapp/presentation/view/widgets/weather_text_widget.dart';




class MainDashBoardPage extends StatelessWidget {
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
