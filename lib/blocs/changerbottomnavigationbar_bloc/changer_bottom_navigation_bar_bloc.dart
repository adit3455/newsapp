import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'changer_bottom_navigation_bar_event.dart';
part 'changer_bottom_navigation_bar_state.dart';

class ChangerBottomNavigationBarBloc extends Bloc<
    ChangerBottomNavigationBarEvent, ChangerBottomNavigationBarState> {
  ChangerBottomNavigationBarBloc()
      : super(const ChangerBottomNavigationBarInitial()) {
    on<OnSelectedIndex>(_onSelectedIndex);
  }
  void _onSelectedIndex(
      OnSelectedIndex event, Emitter<ChangerBottomNavigationBarState> emit) {
    emit(ChangerBottomNavigationBarInitial(selectedIndex: event.value));
  }
}
