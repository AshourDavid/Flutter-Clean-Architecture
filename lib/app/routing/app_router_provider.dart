import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supa_pro/app/routing/routes_names.dart';
import 'package:supa_pro/features/todo/presentation/pages/loading_page.dart';
import 'package:supa_pro/features/todo/presentation/pages/todos_list_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/todos_list',
    routes: [
      GoRoute(
        name: loadingRoute,
        path: '/loading',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: LoadingPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),
      GoRoute(
        name: todosListRoute,
        path: '/todos_list',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: TodosListPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),
    ],
  );
});
