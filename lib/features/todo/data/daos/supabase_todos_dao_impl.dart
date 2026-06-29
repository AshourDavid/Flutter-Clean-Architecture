import 'package:supa_pro/core/utils/supabase_exception_mapper.dart';
import 'package:supa_pro/features/todo/data/daos/todos_dao.dart';
import 'package:supa_pro/features/todo/data/dtos/todo_request_dto.dart';
import 'package:supa_pro/features/todo/data/dtos/todo_response_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseTodosDaoImpl implements TodosDao {
  final SupabaseClient client;

  SupabaseTodosDaoImpl({required this.client});

  @override
  Future<TodoResponseDto> addTodo(TodoRequestDto todo) async {
    try {
      final Map<String, dynamic> response =
          (await client.from('todos').insert(todo.toMap()).select()).first;
      return TodoResponseDto.fromMap(response);
    } catch (e) {
      // mapping supabase exception into my custom exception for separation of concerns
      throw supabaseExceptionMapper(e);
    }
  }

  @override
  Future<void> deleteTodo(int id) async {
    try {
      await client.from('todos').delete().eq('id', id);
    } catch (e) {
      // mapping supabase exception into my custom exception for separation of concerns
      throw supabaseExceptionMapper(e);
    }
  }

  @override
  Future<List<TodoResponseDto>> getAllTodos() async {
    try {
      final List<Map<String, dynamic>> response = await client
          .from('todos')
          .select();

      final List<TodoResponseDto> todosList = response.map((e) {
        return TodoResponseDto.fromMap(e);
      }).toList();
      return todosList;
    } catch (e) {
      // mapping supabase exception into my custom exception for separation of concerns
      throw supabaseExceptionMapper(e);
    }
  }
}
