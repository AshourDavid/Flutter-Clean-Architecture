import 'package:supa_pro/core/errors/exceptions.dart';
import 'package:supa_pro/core/errors/failures.dart';

Failure exceptionToFailureMapper(Exception exception) {
  return switch (exception) {
    // DATABASE
    LocalDatabaseException() => const LocalDatabaseFailure(),
    TableNotFoundException() => const TableNotFoundFailure(),
    DuplicateEntryException() => const DuplicateEntryFailure(),
    DataRelationException() => const DataRelationFailure(),
    PermissionDeniedException() => const PermissionDeniedFailure(),
    DataTypeMismatchException() => const DataTypeMismatchFailure(),

    // AUTHENTICATION
    RateLimitException() => const RateLimitFailure(),
    LocalAuthException() => const LocalAuthFailure(),
    InvalidCredentialsException() => const InvalidCredentialsFailure(),
    AuthRetryableException() => const AuthRetryableFailure(),
    AuthPkceException() => const AuthPkceFailure(),
    AccountAlreadyExistsException() => const AccountAlreadyExistsFailure(),
    UnauthenticatedUserException() => const UnauthenticatedUserFailure(),

    // STORAGE
    LocalStorageException() => const LocalStorageFailure(),
    ResourceNotFoundException() => const ResourceNotFoundFailure(),
    FileTooLargeException() => const FileTooLargeFailure(),
    FileConflictException() => const FileConflictFailure(),

    // NETWORK
    NetworkConnectivityException() => const NetworkConnectivityFailure(),
    NetworkTimeoutException() => const NetworkTimeoutFailure(),
    RealtimeStreamException() => const RealtimeStreamFailure(),
    HandShakeException() => const HandShakeFailure(),
    // DEFAULT (Fallback)
    _ => const LocalDatabaseFailure(), // Or create a GeneralFailure class
  };
}
