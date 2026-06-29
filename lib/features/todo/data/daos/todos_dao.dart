import 'package:supa_pro/features/todo/data/dtos/todo_request_dto.dart';
import 'package:supa_pro/features/todo/data/dtos/todo_response_dto.dart';

abstract interface class TodosDao {
  Future<TodoResponseDto> addTodo(TodoRequestDto todo);
  Future<void> deleteTodo(int id);
  Future<List<TodoResponseDto>> getAllTodos();
}
