import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_changer_list_event.dart';
part 'auth_changer_list_state.dart';

class AuthChangerListBloc
    extends Bloc<AuthChangerListEvent, AuthChangerListState> {
  AuthChangerListBloc() : super(const AuthChangerListInitial()) {
    on<OnSelectedIndexAuth>(_onSelectedIndex);
  }

  void _onSelectedIndex(
      OnSelectedIndexAuth event, Emitter<AuthChangerListState> emit) {
    emit(AuthChangerListInitial(selectedIndex: event.value));
  }
}
