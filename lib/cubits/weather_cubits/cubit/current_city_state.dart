// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'current_city_cubit.dart';

class CurrentCityState extends Equatable {
  final WeatherInfo? city;

  const CurrentCityState({required this.city});

  factory CurrentCityState.initial() {
    return CurrentCityState(city: null);
  }

  @override
  List<Object?> get props => [city];

  @override
  String toString() => 'CurrentCityState: $city';

  CurrentCityState copyWith({
    WeatherInfo? city,
  }) {
    return CurrentCityState(
      city: city ?? this.city,
    );
  }
}

