import 'package:untitled/data/models/categories_model.dart';
import 'package:untitled/data/models/dishes.dart';

abstract class IReposCategory{
  Future<Test> fetchListCategory();

  Future<Dishes> fetchDishes();
}