class WeatherModel {
  final String cityName;
  final String? image;
  final String conditiionDay;
  final DateTime lastUpdated;
  final double maxtemp;
  final double mintemp;
  final double avgtemp;

  WeatherModel(
      {required this.cityName,
      this.image,
      required this.conditiionDay,
      required this.lastUpdated,
      required this.maxtemp,
      required this.mintemp,
      required this.avgtemp});

  factory WeatherModel.fromjson(json) {
    return WeatherModel(
        cityName: json['location']['name'],
        conditiionDay: json['current']['condition']['text'],
        lastUpdated: DateTime.parse(json['current']['last_updated']),
        maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        avgtemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        image: json['current']['condition']['icon']);
  }
}
