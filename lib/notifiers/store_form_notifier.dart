import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fp_util/fp_util.dart';
import 'package:path/path.dart';
import 'package:store_management_system/repositories/store_repository.dart';
import 'package:store_management_system/services/storage_service.dart';

import '../dtos/store_dto.dart';
import '../states/store_form_state.dart';

class StoreFormNotifier extends StateNotifier<StoreFormState> {
  final StoreRepository repository;
  final StorageService storageService;

  StoreFormNotifier(
    this.repository,
    this.storageService,
  ) : super(StoreFormState());

  /// Update name
  void updateName(String name) {
    state = state.copyWith(name: name);
    _validateForm();
  }

  /// Update phone
  void updatePhone(String phone) {
    state = state.copyWith(phone: phone);
    _validateForm();
  }

  /// Update description
  void updateDescription(String description) {
    state = state.copyWith(description: description);
    _validateForm();
  }

  /// Update address
  void updateAddress(String address) {
    state = state.copyWith(address: address);
    _validateForm();
  }

  /// Update location
  void updateLocation(String location) {
    state = state.copyWith(location: location);
    _validateForm();
  }

  /// Update store cover
  void updateStoreCover(String storeCover) {
    state = state.copyWith(storeCover: storeCover);
    _validateForm();
  }

  /// get store cover
  String? get getStoreCover => state.storeCover;

  /// Save store to Supabase
  Future<void> saveStore() async {
    if (!state.isFormValid) return;

    state = state.copyWith(isLoading: true);
    try {
      /// Define the storage bucket and path
      final path =
          'store_covers/${DateTime.now().millisecondsSinceEpoch}${extension(state.storeCover!)}';

      await storageService.uploadFile(
        File(state.storeCover!),
        'store',
        path,
      );

      final store = StoreDto(
        name: state.name,
        phone: state.phone,
        description: state.description,
        address: state.address,
        location: state.location,
        storeCover: path,
      );
      await repository.addStore(store);
    } catch (error, stacktrace) {
      Logger.e('Error saving store: $error', stackTrace: stacktrace);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  /// Validate the form: check if all required fields are filled
  void _validateForm() {
    final isValid = state.name.isNotEmpty &&
        state.phone.isNotEmpty &&
        state.storeCover.isNotNullNotEmpty &&
        state.address.isNotEmpty;

    state = state.copyWith(isFormValid: isValid);
  }
}
