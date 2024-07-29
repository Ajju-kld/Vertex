part of 'bottom_navigation_bloc.dart';

class BottomNavigationState extends Equatable {
  const BottomNavigationState({required this.index});
  final int index;

  @override
  List<Object> get props => [index];
}

class BottomNavigationInitial extends BottomNavigationState {
  BottomNavigationInitial({required int index}) : super(index: index);

  @override
  List<Object> get props => [index];
}
