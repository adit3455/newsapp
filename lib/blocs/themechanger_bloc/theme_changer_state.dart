part of 'theme_changer_bloc.dart';

abstract class ThemeChangerTwoState extends Equatable {
  const ThemeChangerTwoState();

  @override
  List<Object> get props => [];
}

class ThemeChangerTwoInitial extends ThemeChangerTwoState {
  final bool value;

  const ThemeChangerTwoInitial({this.value = false});
  @override
  List<Object> get props => [value];
}
