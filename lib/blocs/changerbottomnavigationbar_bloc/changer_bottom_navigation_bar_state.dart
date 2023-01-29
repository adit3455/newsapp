part of 'changer_bottom_navigation_bar_bloc.dart';

abstract class ChangerBottomNavigationBarState extends Equatable {
  const ChangerBottomNavigationBarState();

  @override
  List<Object> get props => [];
}

class ChangerBottomNavigationBarInitial
    extends ChangerBottomNavigationBarState {
  final int selectedIndex;

  const ChangerBottomNavigationBarInitial({this.selectedIndex = 0});

  @override
  List<Object> get props => [selectedIndex];
}
