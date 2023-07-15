import 'package:flutter/material.dart';
import 'package:weatherapp/common/constant/appColorConstant.dart';
import 'package:weatherapp/presentation/view/widgets/city_detail_page_body.dart';
import 'package:weatherapp/presentation/view/widgets/detail_page_appBar.dart';

class WeatherScreen extends StatefulWidget {
  final String lat;
  final String long;
  const WeatherScreen({super.key, required this.lat, required this.long});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              orangeColor,
              Colors.white,
              Colors.white,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child:    Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15, top: 50),
          child: ListView(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const WeatherDetailScreenAppBar(),
                const Divider(
                  color: Colors.black12,
                ),
                const SizedBox(height: 40),
                WeatherDetailPageBody(lat: widget.lat,long: widget.long,)
              ]),
            ],
          ),
        ),
      )
    );
  }
}

class SlidePageRoute<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;

  SlidePageRoute({required this.builder})
      : super(
          transitionDuration: const Duration(milliseconds: 400),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return builder(context);
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}
