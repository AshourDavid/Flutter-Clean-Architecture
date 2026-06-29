import 'package:dartz/dartz.dart';
import 'package:supa_pro/core/errors/failures.dart';
import 'package:supa_pro/features/todo/domain/entities.dart/todo.dart';

abstract interface class GetAllTodosUsecase {
  Future<Either<Failure, List<Todo>>> call();
}
