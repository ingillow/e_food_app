import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/presentation/pages/dishes_page.dart';

import '../presentation/pages/search_page.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const DishesPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'dishes',
          builder: (BuildContext context, GoRouterState state) {
            return const DishesPage();
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