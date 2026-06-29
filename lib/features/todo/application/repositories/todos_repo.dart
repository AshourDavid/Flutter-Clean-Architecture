import 'package:dartz/dartz.dart';
import 'package:supa_pro/core/errors/failures.dart';
import 'package:supa_pro/features/todo/domain/entities.dart/todo.dart';

abstract interface class TodosRepo {
  Future<Either<Failure, Todo>> addTodo(String title);
  Future<Either<Failure, Unit>> deleteTodo(int id);
  Future<Either<Failure, List<Todo>>> getAllTodos();
}
