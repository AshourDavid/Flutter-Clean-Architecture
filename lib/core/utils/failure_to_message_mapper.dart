import 'package:supa_pro/core/errors/failures.dart';
import 'package:supa_pro/core/strings/failure_messages.dart';

String failureToMessageMapper(Failure failure) {
  return switch (failure) {
    // DATABASE FAILURES
    LocalDatabaseFailure() => kLocalDatabaseFailureMsg,
    TableNotFoundFailure() => kTableNotFoundFailureMsg,
    DuplicateEntryFailure() => kDuplicateEntryFailureMsg,
    DataRelationFailure() => kDataRelationFailureMsg,
    PermissionDeniedFailure() => kPermissionDeniedFailureMsg,
    DataTypeMismatchFailure() => kDataTypeMismatchFailureMsg,

    // AUTHENTICATION FAILURES
    RateLimitFailure() => kRateLimitFailureMsg,
    LocalAuthFailure() => kLocalAuthFailureMsg,
    InvalidCredentialsFailure() => kInvalidCredentialsFailureMsg,
    AuthRetryableFailure() => kAuthRetryableFailureMsg,
    AuthPkceFailure() => kAuthPkceFailureMsg,
    AccountAlreadyExistsFailure() => kAccountAlreadyExistsFailureMsg,
    UnauthenticatedUserFailure() => kUnauthenticatedUserFailureMsg,

    // STORAGE FAILURES
    LocalStorageFailure() => kLocalStorageFailureMsg,
    ResourceNotFoundFailure() => kResourceNotFoundFailureMsg,
    FileTooLargeFailure() => kFileTooLargeFailureMsg,
    FileConflictFailure() => kFileConflictFailureMsg,

    // NETWORK FAILURES
    NetworkConnectivityFailure() => kNetworkConnectivityFailureMsg,
    NetworkTimeoutFailure() => kNetworkTimeoutFailureMsg,
    RealtimeStreamFailure() => kRealtimeStreamFailureMsg,
    HandShakeFailure() => kHandShakeFailureMsg,
    // Default fallback
    _ => "An unexpected error occurred.",
  };
}
