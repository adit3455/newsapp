part of 'changer_bottom_navigation_bar_bloc.dart';

abstract class ChangerBottomNavigationBarEvent extends Equatable {
  const ChangerBottomNavigationBarEvent();

  @override
  List<Object> get props => [];
}

class OnSelectedIndex extends ChangerBottomNavigationBarEvent {
  final int value;

  const OnSelectedIndex({required this.value});

  @override
  List<Object> get props => [value];
}
