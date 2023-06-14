import 'package:dio/dio.dart';
import 'package:untitled/data/models/categories_model.dart';
import 'package:untitled/data/remote/api_service_client.dart';
import 'package:untitled/data/repository/Irepos_category.dart';

class CategoriesDataRepository  implements IReposCategory{

  ApiServiceClient apiServiceClients = ApiServiceClient(Dio());

  @override
  Future<Test> fetchListCategory() async {
    try {
      final categoryList = await apiServiceClients.getCategoriesList();
      return categoryList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
