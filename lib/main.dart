import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled/data/di/category_repos_di.dart';
import 'package:untitled/data/models/categories_model.dart';
import 'package:untitled/data/repository/categories_repo.dart';
import 'package:untitled/presentation/providers/provider_list_categories.dart';


final getIt = GetIt.instance;
final userRepository = CategoryRepoFactory.createCategory();

void setupLocator() {
  getIt.registerLazySingleton<CategoriesReposImpl>(() => CategoryRepoFactory.createCategory());
}


void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyWidget(),
    );
  }
}
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userRepository = getIt<CategoriesReposImpl>();

    return Scaffold(
      body: FutureBuilder<Test>(
        future: userRepository.getCategoryList(),
        builder: (context, snapshot) {
        return ListView.builder(itemCount: snapshot.data?.ategories.length ?? 0, itemBuilder: (context, index){
          return  Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10), // adjust the border radius according to your needs
                  child: Image.network(
                    snapshot.data?.ategories[index].imageUrl ?? '',
                  ),
                ),
              ),
              Positioned(
              bottom: 70,
                left: 30,
                child: Container(
                  child: Text(
                    snapshot.data?.ategories[index].name ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          );
        });
        },
      ),
    );
  }
}
/*class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryBloc = BlocProvider.of<CategoryBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CategoryLoadedState) {
            final categories = state.categories;
            // Отображение списка категорий
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return ListTile(
                  title: Text(category.categories[index].name ?? ''),
                  onTap: () {
                  },
                );
              },
            );
          } else if (state is CategoryErrorState) {
            return Text('Error: ${state.errorMessage}');
          } else {
            return Container();
          }
        },
      ),
    );
  }
}*/

