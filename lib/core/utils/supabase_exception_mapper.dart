import 'dart:io';
import 'dart:async';
import 'package:supa_pro/core/errors/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Maps Supabase/Network errors to domain-specific local exceptions.
Exception supabaseExceptionMapper(dynamic error) {
  // ---------------------------------------------------------
  // 1. DATABASE EXCEPTIONS (`PostgrestException`)
  // ---------------------------------------------------------
  if (error is PostgrestException) {
    switch (error.code) {
      case '42P01':
        return const TableNotFoundException();
      case '23505':
        return const DuplicateEntryException();
      case '23503':
        return const DataRelationException();
      case '22P02':
        return const DataTypeMismatchException();
      case '42501': // Standard Postgres code for insufficient privilege (RLS)
        return const PermissionDeniedException();
      default:
        // Fallback checks for RLS based on error message string
        final message = error.message.toLowerCase();
        if (message.contains('row-level security') ||
            message.contains('policy') ||
            message.contains('permission denied')) {
          return const PermissionDeniedException();
        }
        return const LocalDatabaseException();
    }
  }

  // ---------------------------------------------------------
  // 2. AUTHENTICATION EXCEPTIONS (`AuthException`)
  // ---------------------------------------------------------
  if (error is AuthException) {
    final message = error.message.toLowerCase();

    // Check specific Auth sub-types first
    if (error is AuthRetryableFetchException) {
      return const AuthRetryableException();
    }

    if (error.statusCode == '429') {
      return const RateLimitException();
    }

    // Check for PKCE issues
    if (error is AuthPKCEGrantCodeExchangeError || message.contains('pkce')) {
      return const AuthPkceException();
    }

    // Match based on status codes or standard Supabase error messages
    if (message.contains('invalid login credentials') ||
        message.contains('invalid credentials')) {
      return const InvalidCredentialsException();
    }
    if (message.contains('already registered') ||
        message.contains('already exists')) {
      return const AccountAlreadyExistsException();
    }
    if (error.statusCode == '401' ||
        message.contains('unauthenticated') ||
        message.contains('not logged in')) {
      return const UnauthenticatedUserException();
    }

    return const LocalAuthException();
  }

  // ---------------------------------------------------------
  // 3. STORAGE EXCEPTIONS (`StorageException`)
  // ---------------------------------------------------------
  if (error is StorageException) {
    final statusCode = int.tryParse(error.statusCode ?? '');
    final message = error.message.toLowerCase();

    if (statusCode == 404 || message.contains('not found')) {
      return const ResourceNotFoundException();
    }
    if (statusCode == 413 ||
        message.contains('too large') ||
        message.contains('exceeds')) {
      return const FileTooLargeException();
    }
    // Storage conflicts usually return 400 or 409 depending on the specific API call
    if (statusCode == 409 || message.contains('already exists')) {
      return const FileConflictException();
    }

    return const LocalStorageException();
  }

  // ---------------------------------------------------------
  // 4. NETWORK & REALTIME EXCEPTIONS
  // ---------------------------------------------------------
  if (error is SocketException) {
    return const NetworkConnectivityException();
  }

  if (error is TimeoutException) {
    return const NetworkTimeoutException();
  }

  // Catch realtime connection/subscription drops
  if (error is RealtimeSubscribeException ||
      error.toString().toLowerCase().contains('realtime')) {
    return const RealtimeStreamException();
  }

  if (error is HandshakeException) {
    return const HandShakeException();
  }

  // ---------------------------------------------------------
  // 5. UNKNOWN FALLBACK
  // ---------------------------------------------------------
  return Exception('An unknown error occurred: $error');
}
