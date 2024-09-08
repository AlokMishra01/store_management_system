import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Supabase client provider
final supabaseProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

// Auth state provider
final authStateProvider = StreamProvider((ref) {
  final client = ref.watch(supabaseProvider);
  return client.auth.onAuthStateChange.map((event) => event.session);
});

// Auth provider for signing in
final authProvider = Provider((ref) => AuthService(ref));

class AuthService {
  final Ref _ref;

  AuthService(this._ref);

  Future<void> signIn(String email, String password) async {
    final client = _ref.read(supabaseProvider);
    try {
      final response = await client.auth.signInWithPassword(email: email, password: password);

      // You can perform additional checks here if necessary
      if (response.session == null) {
        throw Exception('Login failed: No session found.');
      }
    } on AuthException catch (e) {
      // Handle specific Supabase auth exceptions
      throw Exception('Login failed: ${e.message}');
    } catch (e) {
      // Handle other errors
      throw Exception('An unexpected error occurred: $e');
    }
  }

  Future<void> signOut() async {
    final client = _ref.read(supabaseProvider);
    try {
      await client.auth.signOut();
    } catch (e) {
      throw Exception('Sign out failed: $e');
    }
  }
}
