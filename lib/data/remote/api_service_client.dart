import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:untitled/data/models/categories_model.dart';
import 'package:untitled/data/models/dishes.dart';

part 'api_service_client.g.dart';

@RestApi(baseUrl: 'https://run.mocky.io/v3/')
abstract class ApiServiceClient {
  factory ApiServiceClient(Dio dio, {String baseUrl}) = _ApiServiceClient;

  @GET('058729bd-1402-4578-88de-265481fd7d54')
  Future<Test> getCategoriesList();

  @GET('aba7ecaa-0a70-453b-b62d-0e326c859b3b')
  Future<Dishes> getDishesList();
}

