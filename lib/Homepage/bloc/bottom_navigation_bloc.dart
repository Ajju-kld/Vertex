import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super( BottomNavigationInitial(index: 0)) {
    on<BottomNavigationEvent>((event, emit) {
      if (event is Tabchanged) {
        print(event.index );
        emit(BottomNavigationInitial(index: event.index));
      }
    });
  }
}
