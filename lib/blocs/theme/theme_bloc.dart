import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> with HydratedMixin {
  ThemeBloc() : super(ThemeState.initial()) {
    hydrate();
    on<ToggleThemeEvent>((event, emit) {
      emit(state.copyWith(
        colorTheme: state.colorTheme == ColorTheme.DARK 
          ? ColorTheme.LIGHT 
          : ColorTheme.DARK
        )
      );
    });
  }
  
  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromJson(json);
  }
  
  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toJson();
  }
}
