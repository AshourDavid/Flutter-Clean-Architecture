// DATABASE EXCEPTIONS

/// Generic or unclassified database error.
class LocalDatabaseException implements Exception {
  const LocalDatabaseException();
}

/// Thrown when a targeted table or view name does not exist (Postgres code 42P01).
class TableNotFoundException implements Exception {
  const TableNotFoundException();
}

/// Thrown when inserting a duplicate value into a unique column (Postgres code 23505).
class DuplicateEntryException implements Exception {
  const DuplicateEntryException();
}

/// Thrown when a foreign key relationship constraint is violated (Postgres code 23503).
class DataRelationException implements Exception {
  const DataRelationException();
}

/// Thrown when a Row-Level Security (RLS) policy blocks the read/write request.
class PermissionDeniedException implements Exception {
  const PermissionDeniedException();
}

/// Thrown when data types do not match the database schema expectations (Postgres code 22P02).
class DataTypeMismatchException implements Exception {
  const DataTypeMismatchException();
}

// AUTHENTICATION EXCEPTIONS

class RateLimitException implements Exception {
  const RateLimitException();
}

/// Generic or unclassified authentication error.
class LocalAuthException implements Exception {
  const LocalAuthException();
}

/// Thrown when credentials (email/password) are incorrect or invalid.
class InvalidCredentialsException implements Exception {
  const InvalidCredentialsException();
}

/// Thrown when the authentication server is down or temporarily unreachable.
class AuthRetryableException implements Exception {
  const AuthRetryableException();
}

/// Thrown if the PKCE handshake or deep-link code verification fails during OAuth sign-in.
class AuthPkceException implements Exception {
  const AuthPkceException();
}

/// Thrown during signup if the email or identity is already registered.
class AccountAlreadyExistsException implements Exception {
  const AccountAlreadyExistsException();
}

/// Thrown when an operation requires an active user session, but the user is logged out.
class UnauthenticatedUserException implements Exception {
  const UnauthenticatedUserException();
}

// STORAGE EXCEPTIONS

/// Generic or unclassified cloud storage error.
class LocalStorageException implements Exception {
  const LocalStorageException();
}

/// Thrown when a targeted storage bucket or file path cannot be found (HTTP 404).
class ResourceNotFoundException implements Exception {
  const ResourceNotFoundException();
}

/// Thrown when a file exceeds the maximum allowed file size limits (HTTP 413).
class FileTooLargeException implements Exception {
  const FileTooLargeException();
}

/// Thrown when uploading a file to an occupied path without explicit permission to overwrite.
class FileConflictException implements Exception {
  const FileConflictException();
}

// NETWORK EXCEPTIONS

/// Thrown when the device has no internet access or cannot resolve the host server.
class NetworkConnectivityException implements Exception {
  const NetworkConnectivityException();
}

/// Thrown when a database query or network request times out before receiving a response.
class NetworkTimeoutException implements Exception {
  const NetworkTimeoutException();
}

/// Thrown when real-time streaming sockets or listening channels disconnect unexpectedly.
class RealtimeStreamException implements Exception {
  const RealtimeStreamException();
}

/// Thrown when untrusted certificate
class HandShakeException implements Exception {
  const HandShakeException();
}
