import 'package:fp_util/fp_util.dart';
import 'package:store_management_system/dtos/store_dto.dart';
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
      Logger.e(
        'Error fetching store: $error',
        error: error,
        stackTrace: stacktrace,
      );
      return false;
    }
  }

  /// Get details of the store
  Future<Map<String, dynamic>?> getStoreDetails() async {
    /// Get the current authenticated user
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw Exception("User not authenticated");
    }

    try {
      final response = await supabase
          .from('stores')
          .select('*')
          .eq('user_id', user.id)
          .single();

      return response;
    } catch (error, stacktrace) {
      Logger.e(
        'Error fetching store details: $error',
        error: error,
        stackTrace: stacktrace,
      );
      return null;
    }
  }

  /// Add a new store
  Future<void> addStore(StoreDto store) async {
    try {
      final response = await supabase.from('stores').insert({
        'name': store.name,
        'phone': store.name,
        'description': store.description,
        'address': store.address,
        'location': store.location,
      }).select();

      Logger.i('Store added successfully: $response');
    } catch (error, stacktrace) {
      Logger.e(
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

      Logger.i('Store updated successfully: $response');
    } catch (error, stacktrace) {
      Logger.e(
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

      Logger.i('Store deleted successfully: $response');
    } catch (error, stacktrace) {
      Logger.e(
        'Error deleting store: $error',
        error: error,
        stackTrace: stacktrace,
      );
    }
  }
}
