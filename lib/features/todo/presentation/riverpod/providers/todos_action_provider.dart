import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supa_pro/core/utils/failure_to_message_mapper.dart';
import 'package:supa_pro/features/todo/application/usecases/add_todo_usecase/add_todo_usecase.dart';
import 'package:supa_pro/features/todo/application/usecases/delete_todo_usecase/delete_todo_usecase.dart';
import 'package:supa_pro/features/todo/presentation/riverpod/providers/todos_list_provider.dart';
import 'package:supa_pro/features/todo/todos_providers.dart';

final todosActionProvider = AsyncNotifierProvider(() {
  return AsyncTodosActionNotifier();
});

class AsyncTodosActionNotifier extends AsyncNotifier<String> {
  late final DeleteTodoUsecase deleteTodoUsecase;
  late final AddTodoUsecase addTodoUsecase;

  @override
  Future<String> build() async {
    deleteTodoUsecase = ref.read(deleteTodoUsecaseProvider);
    addTodoUsecase = ref.read(addTodoUsecaseProvider);
    return 'initial';
  }

  Future<void> addTodo(String title) async {
    state = AsyncLoading();
    final result = await addTodoUsecase.call(title);
    result.fold(
      (l) async {
        state = AsyncError(failureToMessageMapper(l), StackTrace.current);
        await Future.delayed(const Duration(seconds: 2));
        state = AsyncData('initial');
      },
      (r) async {
        ref.read(todosListProvider.notifier).addTodo(r);
        state = AsyncData('successful');
        await Future.delayed(const Duration(seconds: 1));
        state = AsyncData('initial');
      },
    );
  }

  Future<void> deleteTodo(int id) async {
    final todos = ref.read(todosListProvider).value;
    int index = todos!.indexWhere((t) {
      return t.id == id;
    });
    final todo = todos
        .firstWhere((element) => element.id == id)
        .copyWith(isChecked: false);
    ref.read(todosListProvider.notifier).deleteTodo(id);
    final result = await deleteTodoUsecase.call(id);
    result.fold(
      (l) async {
        await Future.delayed(const Duration(seconds: 2));
        state = AsyncError(failureToMessageMapper(l), StackTrace.current);
        ref.read(todosListProvider.notifier).insertTodo(todo, index);
        state = AsyncData('initial');
      },
      (r) {},
    );

    // checks the todo and if successful don't do anything and if not just insert the todo where it was
  }
}
