import 'package:equatable/equatable.dart';
import 'package:untitled/data/models/dishes.dart';

abstract class DishEvent extends Equatable {
  const DishEvent();
}

class DishListEvent extends DishEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class FilteredByTeg extends DishEvent {
  final Teg teg;

  FilteredByTeg(this.teg);

  @override
  List<Object?> get props => [];
}

class DishToFavsEvent extends DishEvent {
  final Dish dish;

  DishToFavsEvent(this.dish);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
