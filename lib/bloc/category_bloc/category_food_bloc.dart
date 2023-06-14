import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/bloc/category_bloc/category_bloc_event.dart';
import 'package:untitled/bloc/category_bloc/category_food_state.dart';
import 'package:untitled/data/repository/categories_repo.dart';

class CategoryBloc extends Bloc<CharacterListEvent, CharacterListState> {
  CategoriesDataRepository categoriesDataRepository = CategoriesDataRepository();


  CategoryBloc() : super(CharacterListLoading()) {
    on<LoadCharacterListEvent>(
          (event, emit) async {
        emit(CharacterListLoading());
        try {
          final charactersList = await categoriesDataRepository.fetchListCategory();
          emit(CharacterListLoaded(charactersList));
        } catch (e) {
          emit(CharacterListError(e.toString()));
        }
      },
    );
  }
}