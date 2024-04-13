import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_app/weather_models/weather_info.dart';

part 'weather_app_theme_state.dart';

class WeatherAppThemeCubit extends Cubit<WeatherAppThemeState> {
  WeatherAppThemeCubit() : super(WeatherAppThemeState.initial());

  void updateTheme(WeatherInfo weatherInfo) {
    emit(state.copyWith(isDarkTheme: weatherInfo.temperature < 15));
  }
}
