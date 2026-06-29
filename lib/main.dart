import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supa_pro/app/app.dart';
import 'package:supa_pro/core/constants/tokens_keys.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'YOUR_SUPABASE_URL',
    anonKey: 'ANON_KEY',
    authOptions: FlutterAuthClientOptions(
      localStorage: LocalSecureStorage(),
      authFlowType: AuthFlowType.pkce,
      autoRefreshToken: true,
    ),
    postgrestOptions: PostgrestClientOptions(),
    storageOptions: StorageClientOptions(retryAttempts: 10),
    realtimeClientOptions: const RealtimeClientOptions(
      logLevel: RealtimeLogLevel.info,
    ),

    debug: true,
  );

  runApp(const ProviderScope(child: App()));
}

class LocalSecureStorage extends LocalStorage {
  final storage = FlutterSecureStorage();

  @override
  Future<String?> accessToken() async {
    final t = await storage.read(key: accessTokenKey);
    return t;
  }

  @override
  Future<bool> hasAccessToken() async {
    final r = await storage.containsKey(key: accessTokenKey);
    return r;
  }

  @override
  Future<void> initialize() async {
    // flutter secure storage doesn't need any initializations
  }

  @override
  Future<void> persistSession(String persistSessionString) async {
    await storage.write(key: accessTokenKey, value: persistSessionString);
  }

  @override
  Future<void> removePersistedSession() async {
    await storage.delete(key: accessTokenKey);
  }
}
