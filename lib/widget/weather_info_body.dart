// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_application_1/models/wether_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weatherModel});
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   decoration: const BoxDecoration(
    //     gradient: LinearGradient(
    //         colors: [Colors.transparent, Colors.amberAccent],
    //         begin: Alignment.topCenter,
    //         end: Alignment.bottomCenter),
    //   ),
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherModel.cityName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Text(
                'Updated at ${weatherModel.lastUpdated.hour}:${weatherModel.lastUpdated.minute}',
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network('https:${weatherModel.image}'),
                  Text(
                    weatherModel.avgtemp.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Maxtemp :${weatherModel.maxtemp}',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Mintemp :${weatherModel.mintemp}',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                weatherModel.conditiionDay,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
