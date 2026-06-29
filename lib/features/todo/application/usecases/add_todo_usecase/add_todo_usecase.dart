import 'package:dartz/dartz.dart';
import 'package:supa_pro/features/todo/domain/entities.dart/todo.dart';

import '../../../../../core/errors/failures.dart';

abstract interface class AddTodoUsecase {
  Future<Either<Failure, Todo>> call(String title);
}
