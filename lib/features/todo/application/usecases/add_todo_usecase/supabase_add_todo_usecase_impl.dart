import 'package:dartz/dartz.dart';
import 'package:supa_pro/core/errors/failures.dart';
import 'package:supa_pro/features/todo/application/repositories/todos_repo.dart';
import 'package:supa_pro/features/todo/application/usecases/add_todo_usecase/add_todo_usecase.dart';
import 'package:supa_pro/features/todo/domain/entities.dart/todo.dart';

class SupabaseAddTodoUsecaseImpl implements AddTodoUsecase {
  final TodosRepo todosRepo;

  const SupabaseAddTodoUsecaseImpl({required this.todosRepo});
  @override
  Future<Either<Failure, Todo>> call(String title) async {
    return todosRepo.addTodo(title);
  }
}
