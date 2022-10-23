part of 'bottom_navigation_bloc.dart';

@immutable
abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();
}

class TabLoading extends BottomNavigationState {
  @override
  List<Object> get props => [];
}

class TabLoaded extends BottomNavigationState {
  const TabLoaded({required this.tabs});

  final List<TabModel> tabs;

  @override
  List<Object> get props => [tabs];
}

class TabSelected extends BottomNavigationState {
  const TabSelected({required this.currentIndex});

  final int currentIndex;

  @override
  List<Object> get props => [currentIndex];
}

class Home extends BottomNavigationState {
  @override
  List<Object> get props => [];
}

class Explore extends BottomNavigationState {
  @override
  List<Object> get props => [];
}

class Group extends BottomNavigationState {
  @override
  List<Object> get props => [];
}
