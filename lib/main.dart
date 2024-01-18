import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:flutter_application_1/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:flutter_application_1/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: getThemColor(
                BlocProvider.of<GetWeatherCubit>(context)
                    .weatherModel
                    ?.conditiionDay,
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: const HomeView(),
          );
        }),
      ),
    );
  }
}

MaterialColor getThemColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'sunny':
      return Colors.orange;
    case 'partly cloudy':
      return Colors.blue;
    case 'cloudy':
      return Colors.grey;
    case 'overcast':
      return Colors.grey;
    case 'mist':
      return Colors.grey;
    case 'patchy rain possible':
    case 'patchy snow possible':
    case 'patchy sleet possible':
    case 'patchy freezing drizzle possible':
      return Colors.lightBlue;
    case 'thundery outbreaks possible':
      return Colors.amber;
    case 'blowing snow':
    case 'blizzard':
      return Colors.pink;
    case 'fog':
      return Colors.grey;
    case 'freezing fog':
      return Colors.grey;
    case 'patchy light drizzle':
    case 'light drizzle':
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
      return Colors.blueGrey;
    case 'patchy light rain':
    case 'light rain':
    case 'moderate rain at times':
    case 'moderate rain':
    case 'heavy rain at times':
    case 'heavy rain':
      return Colors.blue;
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
      return Colors.lightBlue;
    case 'light sleet':
    case 'moderate or heavy sleet':
      return Colors.blueGrey;
    case 'patchy light snow':
    case 'light snow':
    case 'patchy moderate snow':
    case 'moderate snow':
    case 'patchy heavy snow':
    case 'heavy snow':
      return Colors.purple;
    case 'ice pellets':
      return Colors.blue;
    case 'light rain shower':
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
      return Colors.blue;
    case 'light sleet showers':
    case 'moderate or heavy sleet showers':
      return Colors.blueGrey;
    case 'light snow showers':
    case 'moderate or heavy snow showers':
      return Colors.orange;
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
      return Colors.blue;
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
      return Colors.amber;
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors.blue;
    default:
      return Colors.amber;
  }
}
