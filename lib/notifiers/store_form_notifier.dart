import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fp_util/fp_util.dart';

import '../dtos/store_dto.dart';
import '../repositories/store_repository.dart';
import '../states/store_form_state.dart';

class StoreFormNotifier extends StateNotifier<StoreFormState> {
  final StoreRepository repository;

  StoreFormNotifier(this.repository) : super(StoreFormState());

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

  /// Save store to Supabase
  Future<void> saveStore() async {
    if (!state.isFormValid) return;

    state = state.copyWith(isLoading: true);
    try {
      final store = StoreDto(
        name: state.name,
        phone: state.phone,
        description: state.description,
        address: state.address,
        location: state.location,
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
        state.address.isNotEmpty;

    state = state.copyWith(isFormValid: isValid);
  }
}
