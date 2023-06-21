import 'package:untitled/data/models/dishes.dart';

abstract class DishFilterState {}

class DishFilterInitial extends DishFilterState {}

class DishFilterLoading extends DishFilterState {}

class DishFilterFilteredLoaded extends DishFilterState {
  final Dishes dishesList;

  DishFilterFilteredLoaded(this.dishesList);
}

class DishFilterError extends DishFilterState {
  final String error;

  DishFilterError(this.error);
}

class ToggleDishesState extends DishFilterState {
  final List<Teg> selected;

  ToggleDishesState(this.selected);
}