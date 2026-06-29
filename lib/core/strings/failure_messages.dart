// DATABASE FAILURE MESSAGES
const String kLocalDatabaseFailureMsg =
    "An unexpected error occurred with the local database.";
const String kTableNotFoundFailureMsg =
    "The requested database table could not be found.";
const String kDuplicateEntryFailureMsg =
    "This record already exists in the database.";
const String kDataRelationFailureMsg =
    "A violation of data relationships occurred.";
const String kPermissionDeniedFailureMsg =
    "You do not have permission to perform this database operation.";
const String kDataTypeMismatchFailureMsg =
    "The data provided does not match the expected format.";

// AUTHENTICATION FAILURE MESSAGES
const String kRateLimitFailureMsg =
    "Too many requests. Please try again later.";
const String kLocalAuthFailureMsg =
    "Failed to authenticate using local credentials.";
const String kInvalidCredentialsFailureMsg = "Invalid username or password.";
const String kAuthRetryableFailureMsg =
    "Authentication failed, but it is safe to retry.";
const String kAuthPkceFailureMsg =
    "A problem occurred during the PKCE authentication flow.";
const String kAccountAlreadyExistsFailureMsg =
    "An account with these details already exists.";
const String kUnauthenticatedUserFailureMsg =
    "You must be logged in to access this feature.";

// STORAGE FAILURE MESSAGES
const String kLocalStorageFailureMsg = "Unable to access local device storage.";
const String kResourceNotFoundFailureMsg =
    "The requested resource could not be found in storage.";
const String kFileTooLargeFailureMsg =
    "The file exceeds the maximum allowed size.";
const String kFileConflictFailureMsg =
    "A conflict occurred while accessing the file.";

// NETWORK FAILURE MESSAGES
const String kNetworkConnectivityFailureMsg =
    "No internet connection detected.";
const String kNetworkTimeoutFailureMsg =
    "The connection timed out. Please check your network.";
const String kRealtimeStreamFailureMsg =
    "The real-time data stream has been interrupted.";
const String kHandShakeFailureMsg =
    "Potential MITM attack , please close the application and try later.";
