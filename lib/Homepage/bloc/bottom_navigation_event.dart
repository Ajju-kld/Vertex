part of 'bottom_navigation_bloc.dart';

final class BottomNavigationEvent extends Equatable {
  final int index;
  const BottomNavigationEvent(
      {required this.index}
  );

  @override
  List<Object> get props => [];
}

final class Tabchanged extends BottomNavigationEvent {
  final int index;
  const Tabchanged({required this.index}):super(index:index);
}

