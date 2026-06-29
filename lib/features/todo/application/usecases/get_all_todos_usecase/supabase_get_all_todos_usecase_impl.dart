import 'package:dartz/dartz.dart';
import 'package:supa_pro/core/errors/failures.dart';
import 'package:supa_pro/features/todo/application/repositories/todos_repo.dart';
import 'package:supa_pro/features/todo/application/usecases/get_all_todos_usecase/get_all_todos_usecase.dart';
import 'package:supa_pro/features/todo/domain/entities.dart/todo.dart';

class SupabaseGetAllTodosUsecaseImpl implements GetAllTodosUsecase {
  final TodosRepo todosRepo;

  const SupabaseGetAllTodosUsecaseImpl({required this.todosRepo});
  @override
  Future<Either<Failure, List<Todo>>> call() async {
    final todos = await todosRepo.getAllTodos();

    return todos;
  }
}
