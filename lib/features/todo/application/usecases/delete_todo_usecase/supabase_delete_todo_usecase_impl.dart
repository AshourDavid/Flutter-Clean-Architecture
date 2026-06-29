import 'package:dartz/dartz.dart';
import 'package:supa_pro/core/errors/failures.dart';
import 'package:supa_pro/features/todo/application/repositories/todos_repo.dart';
import 'package:supa_pro/features/todo/application/usecases/delete_todo_usecase/delete_todo_usecase.dart';

class SupabaseDeleteTodoUsecaseImpl implements DeleteTodoUsecase {
  final TodosRepo todosRepo;

  const SupabaseDeleteTodoUsecaseImpl({required this.todosRepo});
  @override
  Future<Either<Failure, Unit>> call(int id) async {
    return todosRepo.deleteTodo(id);
  }
}
