import 'package:dio/dio.dart';
import 'package:untitled/data/remote/api_service_client.dart';
import 'package:untitled/data/repository/categories_repo.dart';

class CategoryRepoFactory{
  static CategoriesReposImpl createCategory(){
    return CategoriesReposImpl(apiServiceClient: ApiServiceClient(Dio()));
  }
}

