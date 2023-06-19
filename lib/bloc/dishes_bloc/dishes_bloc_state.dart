import 'package:untitled/data/models/dishes.dart';

abstract class DishFilterState {}

class DishFilterInitial extends DishFilterState {}

class DishFilterLoading extends DishFilterState {}

class DishFilterFilteredLoaded extends DishFilterState {
  final Dishes filteredDishes;

  DishFilterFilteredLoaded(this.filteredDishes);
}

class DishFilterError extends DishFilterState {
  final String error;

  DishFilterError(this.error);
}
