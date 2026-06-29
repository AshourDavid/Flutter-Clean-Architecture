import 'package:dartz/dartz.dart';
import 'package:supa_pro/core/errors/failures.dart';

abstract interface class DeleteTodoUsecase {
  Future<Either<Failure, Unit>> call(int id);
}
