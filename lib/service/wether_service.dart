// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/wether_model.dart';

class ServiceWeather {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '3dfd851bf4564700ba984108241801 ';
  ServiceWeather(this.dio);

  Future<WeatherModel> getweather({required String cityName}) async {
    try {
      Response response = await dio.get(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=3&aqi=no&alerts=no');
      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMassage = e.response?.data['error']['message'] ??
          'OOPS ,there was an error ,try later  ';
      throw errorMassage;
    } catch (e) {
      log(e.toString());
      throw Exception('try later');
    }
  }
}
