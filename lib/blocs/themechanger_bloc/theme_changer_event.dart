part of 'theme_changer_bloc.dart';

abstract class ThemeChangerTwoEvent extends Equatable {
  const ThemeChangerTwoEvent();

  @override
  List<Object> get props => [];
}

class OnChangedSwitch extends ThemeChangerTwoEvent {
  final bool value;

  const OnChangedSwitch({required this.value});

  @override
  List<Object> get props => [value];
}
