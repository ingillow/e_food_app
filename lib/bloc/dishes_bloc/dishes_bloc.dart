import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/bloc/dishes_bloc/dishes_bloc_even.dart';
import 'package:untitled/bloc/dishes_bloc/dishes_bloc_state.dart';
import 'package:untitled/data/models/dishes.dart';
import 'package:untitled/data/repository/categories_repo.dart';

class DishFilterBloc extends Bloc<DishFilterEvent, DishFilterState> {
  List<Dish> filteredDishes = [];
  CategoriesDataRepository categoriesDataRepository =
      CategoriesDataRepository();

  DishFilterBloc() : super(DishFilterInitial()) {
    on<TagSelected>(
      (event, emit) async {
        emit(DishFilterLoading());
        try {
          final value = await categoriesDataRepository.fetchDishes();
          emit(DishFilterFilteredLoaded(value));
        } catch (e) {
          throw Exception(e.toString());
        }
      },
    );
  }
}
