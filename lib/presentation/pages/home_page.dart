import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/bloc/category_bloc/category_bloc_event.dart';
import 'package:untitled/bloc/category_bloc/category_food_bloc.dart';
import 'package:untitled/bloc/category_bloc/category_food_state.dart';
import 'package:untitled/presentation/widgets/app_bar_widget.dart';
import 'package:untitled/presentation/widgets/bottom_navigation.dart';
import 'package:untitled/presentation/widgets/error_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBarWidget(),
        ),
      ),
      body: BlocProvider(
        create: (context) => CategoryBloc()..add(LoadCharacterListEvent()),
        child: BlocBuilder<CategoryBloc, CharacterListState>(
          builder: (context, state) {
            if (state is CharacterListLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CharacterListError) {
              return ErrorSWidget();
            } else if (state is CharacterListLoaded) {
              return ListView.builder(
                itemCount: state.charactersList.categories.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {
                               context.go('/dishes');
                            },
                            child: Image.network(
                              state.charactersList.categories[index].imageUrl,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 70,
                        left: 30,
                        child: Text(
                          state.charactersList.categories[index].name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            } else {
              return Container();
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
