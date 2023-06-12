/*
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../data/models/categories_model.dart';
import '../../domain/use_cases/get_categories_list_use_case.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class LoadCategoriesEvent extends CategoryEvent {}

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryLoadedState extends CategoryState {
  final List<Categories> categories;

  const CategoryLoadedState(this.categories);

  @override
  List<Object> get props => [categories];
}

class CategoryErrorState extends CategoryState {
  final String errorMessage;

  const CategoryErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategoriesListUseCase getCategoriesUseCase;

  CategoryBloc({required this.getCategoriesUseCase}) : super(CategoryInitial());

  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is LoadCategoriesEvent) {
      yield CategoryLoadingState();
      try {
        final categories = await getCategoriesUseCase.getCategories();
        yield CategoryLoadedState(categories);
      } catch (error) {
        yield CategoryErrorState(error.toString());
      }
    }
  }
}
*/
