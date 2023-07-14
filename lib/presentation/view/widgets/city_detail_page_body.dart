import 'package:flutter/material.dart';
import 'package:weatherapp/common/constant/appColorConstant.dart';
import 'package:weatherapp/presentation/view/widgets/temp_list.dart';

class WeatherDetailPageBody extends StatelessWidget {
  const WeatherDetailPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'City Name',
          style: TextStyle(
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
                  const Text(
                    '16',
                    style: TextStyle(fontSize: 190),
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
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 60.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            'sunny',
                            style:
                                TextStyle(fontSize: 17, color: greyDarkColor),
                          ),
                        ),
                        Spacer(),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Text(
                                'feel like',
                                style: TextStyle(
                                    fontSize: 17, color: greyDarkColor),
                              ),
                              Text(
                                '16°',
                                style:
                                    TextStyle(fontSize: 17, color: darkBlack),
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
                  const Text(
                    '24°',
                    style: TextStyle(fontSize: 16),
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
                  const Text(
                    '11°',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const SizedBox(
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'humidity',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      '63%',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  width: 150,
                  child: Row(
                    children: [
                      Text(
                        'wind',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        '5 m/s',
                        style: TextStyle(fontSize: 16),
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
          child: const SizedBox(
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                      Text(
                        'pressure',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '764mmHg',
                        style: TextStyle(fontSize: 16),
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
}
