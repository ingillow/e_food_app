import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:untitled/bloc/bottom_nav_bloc/bottom_nav_bloc.dart';
import 'package:untitled/bloc/category_bloc/category_food_bloc.dart';
import 'package:untitled/bloc/dishes_bloc/dishes_bloc.dart';
import 'package:untitled/presentation/pages/dishes_page.dart';
import 'package:untitled/providers/provider_dish.dart';
import 'package:untitled/providers/provider_tags.dart';
import 'package:untitled/router/go_route.dart';

GetIt sl = GetIt.instance;

void setupLocator() {}

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryBloc>(
          create: (BuildContext context) => CategoryBloc(),
        ),
        BlocProvider<NavigationBloc>(create: (context) => NavigationBloc()),
        BlocProvider(
          create: (context) => DishFilterBloc(),
          child:
              DishesPages(), // Replace YourWidget with your actual widget code
        ),
        ChangeNotifierProvider(
            create: (_) => ToggleTags(), child: DishesPages()),
        ChangeNotifierProvider(create: (_) => CartModel(), child: DishesPages())
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        //home: CategoryScreen(),
      ),
    );
  }
}
