import 'package:dartz/dartz.dart';
import 'package:supa_pro/core/errors/failures.dart';
import 'package:supa_pro/core/utils/exception_to_failure_mapper.dart';
import 'package:supa_pro/features/todo/application/repositories/todos_repo.dart';
import 'package:supa_pro/features/todo/data/daos/todos_dao.dart';
import 'package:supa_pro/features/todo/data/dtos/todo_request_dto.dart';
import 'package:supa_pro/features/todo/domain/entities.dart/todo.dart';

class SupabaseTodosRepoImpl implements TodosRepo {
  final TodosDao todosDao;

  const SupabaseTodosRepoImpl({required this.todosDao});
  @override
  Future<Either<Failure, Todo>> addTodo(String title) async {
    try {
      final requestedTodo = TodoRequestDto(title: title);
      final responseTodoDto = await todosDao.addTodo(requestedTodo);
      final todo = Todo(
        id: responseTodoDto.id,
        isChecked: false,
        title: responseTodoDto.title,
      );
      return Right(todo);
    } catch (e) {
      return Left(exceptionToFailureMapper(e as Exception));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteTodo(int id) async {
    try {
      await todosDao.deleteTodo(id);
      return Right(unit);
    } catch (e) {
      return Left(exceptionToFailureMapper(e as Exception));
    }
  }

  @override
  Future<Either<Failure, List<Todo>>> getAllTodos() async {
    try {
      final response = await todosDao.getAllTodos();
      final List<Todo> todos = response
          .map((e) => Todo(id: e.id, title: e.title, isChecked: e.ischecked))
          .toList();
      return Right(todos);
    } catch (e) {
      return Left(exceptionToFailureMapper(e as Exception));
    }
  }
}
