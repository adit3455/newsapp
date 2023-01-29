import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_changer_event.dart';
part 'theme_changer_state.dart';

class ThemeChangerTwoBloc
    extends Bloc<ThemeChangerTwoEvent, ThemeChangerTwoState> {
  ThemeChangerTwoBloc() : super(const ThemeChangerTwoInitial()) {
    on<OnChangedSwitch>(_onChangedSwitch);
  }
  void _onChangedSwitch(
      OnChangedSwitch event, Emitter<ThemeChangerTwoState> emit) {
    emit(ThemeChangerTwoInitial(value: event.value));
  }
}
