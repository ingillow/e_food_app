import 'package:equatable/equatable.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class TabSelectedState extends NavigationState {
  final int selectedIndex;

  const TabSelectedState(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
