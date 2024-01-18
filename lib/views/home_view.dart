import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:flutter_application_1/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:flutter_application_1/views/search_view.dart';
import 'package:flutter_application_1/widget/no_weather_body.dart';
import 'package:flutter_application_1/widget/weather_info_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body:
          BlocBuilder<GetWeatherCubit, WeatherState>(builder: (context, state) {
        if (state is NoWeatherState) {
          return const NoWeatherBody();
        } else if (state is WeatherLoadedState) {
          return WeatherInfoBody(
            weatherModel: state.weatherModel,
          );
        } else {
          return const Text('OOPS, there was an error');
        }
      }),
    );
  }
}
