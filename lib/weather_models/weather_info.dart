// ignore_for_file: public_member_api_docs, sort_constructors_first
class WeatherInfo {
  final String city;
  final DateTime time;
  final double temperature;
  final String minTemperature;
  final String maxTemperature;
  final String icon;
  final String condition;
  
  WeatherInfo({
    required this.city,
    required this.time,
    required this.temperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.icon,
    required this.condition,
  });
}
