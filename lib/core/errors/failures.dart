abstract class Failure {
  const Failure();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Failure && other.runtimeType == runtimeType;
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

//  DATABASE FAILURES

class LocalDatabaseFailure extends Failure {
  const LocalDatabaseFailure();
}

class TableNotFoundFailure extends Failure {
  const TableNotFoundFailure();
}

class DuplicateEntryFailure extends Failure {
  const DuplicateEntryFailure();
}

class DataRelationFailure extends Failure {
  const DataRelationFailure();
}

class PermissionDeniedFailure extends Failure {
  const PermissionDeniedFailure();
}

class DataTypeMismatchFailure extends Failure {
  const DataTypeMismatchFailure();
}

//  AUTHENTICATION FAILURES

class RateLimitFailure extends Failure {
  const RateLimitFailure();
}

class LocalAuthFailure extends Failure {
  const LocalAuthFailure();
}

class InvalidCredentialsFailure extends Failure {
  const InvalidCredentialsFailure();
}

class AuthRetryableFailure extends Failure {
  const AuthRetryableFailure();
}

class AuthPkceFailure extends Failure {
  const AuthPkceFailure();
}

class AccountAlreadyExistsFailure extends Failure {
  const AccountAlreadyExistsFailure();
}

class UnauthenticatedUserFailure extends Failure {
  const UnauthenticatedUserFailure();
}

//  STORAGE FAILURES

class LocalStorageFailure extends Failure {
  const LocalStorageFailure();
}

class ResourceNotFoundFailure extends Failure {
  const ResourceNotFoundFailure();
}

class FileTooLargeFailure extends Failure {
  const FileTooLargeFailure();
}

class FileConflictFailure extends Failure {
  const FileConflictFailure();
}

// NETWORK FAILURES

class NetworkConnectivityFailure extends Failure {
  const NetworkConnectivityFailure();
}

class NetworkTimeoutFailure extends Failure {
  const NetworkTimeoutFailure();
}

class RealtimeStreamFailure extends Failure {
  const RealtimeStreamFailure();
}

class HandShakeFailure extends Failure {
  const HandShakeFailure();
}
