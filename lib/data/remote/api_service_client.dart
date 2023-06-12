
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:untitled/data/models/categories_model.dart';
part 'api_service_client.g.dart';

@RestApi(baseUrl: 'https://run.mocky.io/v3/')

abstract class ApiServiceClient{
  factory ApiServiceClient(Dio dio, {String baseUrl}) = _ApiServiceClient;
  @GET('058729bd-1402-4578-88de-265481fd7d54')
  Future<Test> getCategoriesList();
}


/*
 class ApiServiceDio {
   Dio dio = Dio();

   Future<Test> fetchCategories() async {
     const baseUrl =
         'https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54';
     final response = await dio.get(baseUrl);
     if (response.statusCode == 200) {
       return Test.fromJson(response.data as Map<String, dynamic>);
     } else {
       throw Exception('dshgdh');
     }
   }
 }
*/
