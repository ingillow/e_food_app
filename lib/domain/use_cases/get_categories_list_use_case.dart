import 'package:untitled/data/models/categories_model.dart';
import 'package:untitled/domain/repositories/categories_repos.dart';

class GetCategoriesListUseCase{
  ICategoriesRepos categoriesRepos;
  GetCategoriesListUseCase({required this.categoriesRepos});

 Future<Test> getCategories() async{
   try{
     final res =  await categoriesRepos.getCategoryList();
     return res;
   }catch(e){
     throw Exception(e.toString());
   }

 }
}