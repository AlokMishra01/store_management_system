import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'store_repository_provider.dart';

class AddStoreNotifier extends StateNotifier<AsyncValue<void>> {
  AddStoreNotifier(this.ref) : super(const AsyncValue.data(null));

  final Ref ref;

  Future<void> addStore({
    required String name,
    required String description,
    required String address,
    required String location,
    required String userId,
  }) async {
    state = const AsyncValue.loading();
    try {
      final storeRepository = ref.read(storeRepositoryProvider);
      await storeRepository.addStore(
          name, description, address, location, userId);
      state = const AsyncValue.data(null);
    } catch (error, stacktrace) {
      state = AsyncValue.error(error, stacktrace);
    }
  }
}

final addStoreProvider =
    StateNotifierProvider<AddStoreNotifier, AsyncValue<void>>(
  (ref) => AddStoreNotifier(ref),
);
