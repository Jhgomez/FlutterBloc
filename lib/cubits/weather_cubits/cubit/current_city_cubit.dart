import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_app/weather_models/weather_info.dart';

part 'current_city_state.dart';

class CurrentCityCubit extends Cubit<CurrentCityState> {
  CurrentCityCubit() : super(CurrentCityState.initial());

  void updateDisplayedWeatherInfo(WeatherInfo weatherInfo) {
    emit(state.copyWith(city: weatherInfo));
  }
}
