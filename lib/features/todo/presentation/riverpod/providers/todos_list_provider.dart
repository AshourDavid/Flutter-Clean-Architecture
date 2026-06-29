import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supa_pro/core/utils/failure_to_message_mapper.dart';
import 'package:supa_pro/features/todo/domain/entities.dart/todo.dart';
import 'package:supa_pro/features/todo/todos_providers.dart';

final todosListProvider =
    AsyncNotifierProvider<AsyncTodosListNotifier, List<Todo>>(
      () => AsyncTodosListNotifier(),
      retry: (retryCount, error) {
        return null;
      },
    );

class AsyncTodosListNotifier extends AsyncNotifier<List<Todo>> {
  @override
  Future<List<Todo>> build() async {
    print('build method of the provider is exeucted ..................');
    final getAllTodosUsecase = ref.read(getAllTodosUsecaseProvider);
    final result = await getAllTodosUsecase.call();
    print('getAllTodos executed');
    return result.fold(
      (l) {
        // this will resolve to AsyncError
        print(l);

        final msg = failureToMessageMapper(l);

        throw msg;
      },
      (r) {
        print('returned list of todos');
        // return list of todos
        return r;
      },
    );
  }

  Future<void> loadTodos() async {
    state = AsyncLoading();
    final getAllTodosUsecase = ref.read(getAllTodosUsecaseProvider);
    final result = await getAllTodosUsecase.call();

    result.fold(
      (l) {
        state = AsyncError(failureToMessageMapper(l), StackTrace.current);
      },
      (r) {
        state = AsyncData(r);
      },
    );
  }

  Future<void> addTodo(Todo todo) async {
    state = AsyncData([
      ...state.value!,
      Todo(id: todo.id, title: todo.title, isChecked: false),
    ]);
  }

  Future<void> insertTodo(Todo todo, int index) async {
    final todos = [...(state.value!)];

    todos.insert(index, todo);
    state = AsyncData(todos);
  }

  Future<void> deleteTodo(int id) async {
    await checkTodo(id);
    await Future.delayed(Duration(seconds: 1)); // wait for the animation
    final newList = state.value!.where((element) => element.id != id).toList();
    state = AsyncData(newList);
  }

  Future<void> checkTodo(int id) async {
    state = AsyncData(
      state.value!.map((e) {
        if (id == e.id) {
          e.isChecked = !(e.isChecked);
          return e;
        }
        return e;
      }).toList(),
    );
  }
}
