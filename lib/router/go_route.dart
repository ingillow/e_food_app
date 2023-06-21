import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/presentation/pages/dishes_page.dart';
import 'package:untitled/presentation/pages/home_page.dart';
import 'package:untitled/presentation/pages/search_page.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const CategoryScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'dishes',
          builder: (BuildContext context, GoRouterState state) {
            return const DishesPages();
          },
        ),
        GoRoute(
          path: 'favs',
          builder: (BuildContext context, GoRouterState state) {
            return SavedDishesPage();
          },
        ),
      ],
    ),
  ],
);