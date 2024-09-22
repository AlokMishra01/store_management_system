import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../providers/auth_provider.dart';

class AuthService {
  final Ref _ref;

  AuthService(this._ref);

  Future<void> signIn(String email, String password) async {
    final client = _ref.read(supabaseProvider);
    try {
      final response = await client.auth
          .signInWithPassword(email: email, password: password);

      // You can perform additional checks here if necessary
      if (response.session == null) {
        throw Exception('Login failed: No session found.');
      }
    } on AuthException catch (e) {
      // Handle specific Suspabase auth exceptions
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

  Future<void> googleSignIn() async {
    final client = _ref.read(supabaseProvider);

    if (kIsWeb && !(Platform.isAndroid || Platform.isIOS)) {
      await client.auth.signInWithOAuth(OAuthProvider.google);
      return;
    }

    /// Load environment variables
    await dotenv.load();

    /// Web Client ID that you registered with Google Cloud.
    final webClientId = dotenv.env['WEB_CLIENT_ID'];

    /// iOS Client ID that you registered with Google Cloud.
    final iosClientId = dotenv.env['IOS_CLIENT_ID'];

    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw Exception('No Access Token found.');
    }
    if (idToken == null) {
      throw Exception('No ID Token found.');
    }

    await client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }
}
