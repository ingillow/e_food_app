import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/bloc/bottom_nav_bloc/bottom_nav_event.dart';
import 'package:untitled/bloc/bottom_nav_bloc/bottom_nav_state.dart';


class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(TabSelectedState(0)){
    on((event, emit){
      if(event is TabSelectedEvent){
        emit(TabSelectedState(event.selectedIndex));
      }
    });
  }

/*  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is TabSelectedEvent) {
      yield TabSelectedState(event.selectedIndex);
    }
  }*/
}
