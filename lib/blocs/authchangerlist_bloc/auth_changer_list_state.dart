part of 'auth_changer_list_bloc.dart';

abstract class AuthChangerListState extends Equatable {
  const AuthChangerListState();

  @override
  List<Object> get props => [];
}

class AuthChangerListInitial extends AuthChangerListState {
  final int selectedIndex;

  const AuthChangerListInitial({this.selectedIndex = 0});

  @override
  List<Object> get props => [selectedIndex];
}
