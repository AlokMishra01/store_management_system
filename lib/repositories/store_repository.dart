import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StoreRepository {
  final supabase = Supabase.instance.client;

  /// Check if the user has a store
  Future<bool> userHasStore(String userId) async {
    try {
      final response = await supabase
          .from('stores')
          .select('store_id')
          .eq('user_id', userId)
          .maybeSingle();

      return response != null;
    } catch (error, stacktrace) {
      Logger().e(
        'Error fetching store: $error',
        error: error,
        stackTrace: stacktrace,
      );
      return false;
    }
  }

  /// Get details of the store
  Future<Map<String, dynamic>?> getStoreDetails(String userId) async {
    try {
      final response = await supabase
          .from('stores')
          .select('*')
          .eq('user_id', userId)
          .single();

      return response;
    } catch (error, stacktrace) {
      Logger().e(
        'Error fetching store details: $error',
        error: error,
        stackTrace: stacktrace,
      );
      return null;
    }
  }

  /// Add a new store
  Future<void> addStore(
    String name,
    String description,
    String address,
    String location,
    String userId,
  ) async {
    try {
      final response = await supabase.from('stores').insert({
        'name': name,
        'description': description,
        'address': address,
        'location': location,
        'user_id': userId,
      }).select();

      Logger().i('Store added successfully: $response');
    } catch (error, stacktrace) {
      Logger().e(
        'Error adding store: $error',
        error: error,
        stackTrace: stacktrace,
      );
    }
  }

  /// Update the store
  Future<void> updateStore(
    String storeId,
    String name,
    String description,
    String address,
    String location,
  ) async {
    try {
      final response = await supabase
          .from('stores')
          .update({
            'name': name,
            'description': description,
            'address': address,
            'location': location,
          })
          .eq('id', storeId)
          .select(); // Add select() to return the updated store

      Logger().i('Store updated successfully: $response');
    } catch (error, stacktrace) {
      Logger().e(
        'Error updating store: $error',
        error: error,
        stackTrace: stacktrace,
      );
    }
  }

  /// Remove the store
  Future<void> removeStore(String storeId) async {
    try {
      final response = await supabase
          .from('stores')
          .delete()
          .eq(
            'id',
            storeId,
          )
          .select();

      Logger().i('Store deleted successfully: $response');
    } catch (error, stacktrace) {
      Logger().e(
        'Error deleting store: $error',
        error: error,
        stackTrace: stacktrace,
      );
    }
  }
}
