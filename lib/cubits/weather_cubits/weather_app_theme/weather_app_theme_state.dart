// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_app_theme_cubit.dart';

class WeatherAppThemeState extends Equatable {
  final bool isDarkTheme;

  const WeatherAppThemeState({required this.isDarkTheme});

  factory WeatherAppThemeState.initial() {
    return const WeatherAppThemeState(isDarkTheme: false);
  }

  @override
  List<Object> get props => [isDarkTheme];

  @override
  String toString() => 'WeatherAppThemeState: $isDarkTheme';

  WeatherAppThemeState copyWith({
    bool? isDarkTheme,
  }) {
    return WeatherAppThemeState(
      isDarkTheme: isDarkTheme ?? this.isDarkTheme,
    );
  }
}

