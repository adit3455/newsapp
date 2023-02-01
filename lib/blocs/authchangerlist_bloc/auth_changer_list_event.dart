part of 'auth_changer_list_bloc.dart';

abstract class AuthChangerListEvent extends Equatable {
  const AuthChangerListEvent();

  @override
  List<Object> get props => [];
}

class OnSelectedIndexAuth extends AuthChangerListEvent {
  final int value;

  const OnSelectedIndexAuth({required this.value});

  @override
  List<Object> get props => [value];
}
