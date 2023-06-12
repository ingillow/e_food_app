import 'package:untitled/data/models/categories_model.dart';

import '../../domain/repositories/categories_repos.dart';
import '../remote/api_service_client.dart';

class CategoriesReposImpl extends ICategoriesRepos {
  ApiServiceClient apiServiceClient;

  CategoriesReposImpl({required this.apiServiceClient});

  @override
  Future<Test> getCategoryList() async {
    try {
      final list = await apiServiceClient.getCategoriesList();
      print(list);
      return list;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
