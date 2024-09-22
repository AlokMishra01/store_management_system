import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../store_repository_provider.dart';

class UpdateStoreNotifier extends StateNotifier<AsyncValue<void>> {
  UpdateStoreNotifier(this.ref) : super(const AsyncValue.data(null));

  final Ref ref;

  Future<void> updateStore({
    required String storeId,
    required String name,
    required String description,
    required String address,
    required String location,
  }) async {
    state = const AsyncValue.loading();
    try {
      final storeRepository = ref.read(storeRepositoryProvider);
      await storeRepository.updateStore(
        storeId,
        name,
        description,
        address,
        location,
      );
      state = const AsyncValue.data(null);
    } catch (error, stacktrace) {
      state = AsyncValue.error(error, stacktrace);
    }
  }
}

final updateStoreProvider =
    StateNotifierProvider<UpdateStoreNotifier, AsyncValue<void>>(
  (ref) => UpdateStoreNotifier(ref),
);
