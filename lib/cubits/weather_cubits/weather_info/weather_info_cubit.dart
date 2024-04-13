import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_app/weather_models/weather_info.dart';

part 'weather_info_state.dart';

class WeatherInfoCubit extends Cubit<WeatherInfoState> {
  WeatherInfoCubit() : super(WeatherInfoState.initial());

  void updateDisplayedWeatherInfo(WeatherInfo weatherInfo) {
    emit(state.copyWith(city: weatherInfo));
  }
}
