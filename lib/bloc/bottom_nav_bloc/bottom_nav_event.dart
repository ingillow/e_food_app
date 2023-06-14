import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class TabSelectedEvent extends NavigationEvent {
  final int selectedIndex;

  const TabSelectedEvent(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
