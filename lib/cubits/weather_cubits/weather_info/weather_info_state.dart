// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_info_cubit.dart';

class WeatherInfoState extends Equatable {
  final WeatherInfo? city;

  const WeatherInfoState({required this.city});

  factory WeatherInfoState.initial() {
    return WeatherInfoState(city: null);
  }

  @override
  List<Object?> get props => [city];

  @override
  String toString() => 'CurrentCityState: $city';

  WeatherInfoState copyWith({
    WeatherInfo? city,
  }) {
    return WeatherInfoState(
      city: city ?? this.city,
    );
  }
}

