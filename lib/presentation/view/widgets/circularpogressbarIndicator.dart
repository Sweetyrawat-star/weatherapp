import 'package:flutter/material.dart';

class WeatherCircularProgressIndicator extends StatelessWidget {
  const WeatherCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Center(child: CircularProgressIndicator()),
      ],
    );
  }
}
