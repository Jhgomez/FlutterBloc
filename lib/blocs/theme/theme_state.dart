// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_bloc.dart';

enum ColorTheme{ LIGHT, DARK }

class ThemeState extends Equatable {
  final ColorTheme colorTheme;

  factory ThemeState.initial() {
    return const ThemeState();
  }

  const ThemeState({this.colorTheme = ColorTheme.LIGHT});
  
  @override
  List<Object> get props => [colorTheme];

  @override
  String toString() => 'ThemeState{theme: $colorTheme}';


  ThemeState copyWith({
    ColorTheme? colorTheme,
  }) {
    return ThemeState(
      colorTheme: colorTheme ?? this.colorTheme,
    );
  }
}
