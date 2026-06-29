import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supa_pro/core/providers/supabase_client_provider.dart';
import 'package:supa_pro/features/todo/application/repositories/todos_repo.dart';
import 'package:supa_pro/features/todo/application/usecases/add_todo_usecase/add_todo_usecase.dart';
import 'package:supa_pro/features/todo/application/usecases/add_todo_usecase/supabase_add_todo_usecase_impl.dart';
import 'package:supa_pro/features/todo/application/usecases/delete_todo_usecase/delete_todo_usecase.dart';
import 'package:supa_pro/features/todo/application/usecases/delete_todo_usecase/supabase_delete_todo_usecase_impl.dart';
import 'package:supa_pro/features/todo/application/usecases/get_all_todos_usecase/get_all_todos_usecase.dart';
import 'package:supa_pro/features/todo/application/usecases/get_all_todos_usecase/supabase_get_all_todos_usecase_impl.dart';
import 'package:supa_pro/features/todo/data/daos/supabase_todos_dao_impl.dart';
import 'package:supa_pro/features/todo/data/daos/todos_dao.dart';
import 'package:supa_pro/features/todo/data/repositories/supabase_todos_repo_impl.dart';

// DATA LAYER

final todosDaoProvider = Provider<TodosDao>((ref) {
  return SupabaseTodosDaoImpl(
    client: ref.watch(supabseClientProvider),
  );
});

final todosRepoProvider = Provider<TodosRepo>((ref) {
  return SupabaseTodosRepoImpl(
    todosDao: ref.watch(todosDaoProvider),
  );
});

// APPLICATION LAYER

final addTodoUsecaseProvider = Provider<AddTodoUsecase>((ref) {
  return SupabaseAddTodoUsecaseImpl(
    todosRepo: ref.watch(todosRepoProvider),
  );
});

final deleteTodoUsecaseProvider = Provider<DeleteTodoUsecase>((ref) {
  return SupabaseDeleteTodoUsecaseImpl(
    todosRepo: ref.watch(todosRepoProvider),
  );
});

final getAllTodosUsecaseProvider = Provider<GetAllTodosUsecase>((ref) {
  return SupabaseGetAllTodosUsecaseImpl(
    todosRepo: ref.watch(todosRepoProvider),
  );
});
