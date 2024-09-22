import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../store_repository_provider.dart';

class RemoveStoreNotifier extends StateNotifier<AsyncValue<void>> {
  RemoveStoreNotifier(this.ref) : super(const AsyncValue.data(null));

  final Ref ref;

  Future<void> removeStore(String storeId) async {
    state = const AsyncValue.loading();
    try {
      final storeRepository = ref.read(storeRepositoryProvider);
      await storeRepository.removeStore(storeId);
      state = const AsyncValue.data(null);
    } catch (error, stacktrace) {
      state = AsyncValue.error(error, stacktrace);
    }
  }
}

final removeStoreProvider =
    StateNotifierProvider<RemoveStoreNotifier, AsyncValue<void>>(
  (ref) => RemoveStoreNotifier(ref),
);
