import 'package:dio/dio.dart';
import 'package:flutter_application_1/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:flutter_application_1/models/wether_model.dart';
import 'package:flutter_application_1/service/wether_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
  WeatherModel? weatherModel;

  getWeather({required String cityName}) async {
    try {
      WeatherModel weatherModel =
          await ServiceWeather(Dio()).getweather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
