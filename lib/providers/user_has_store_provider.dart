import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'store_repository_provider.dart';

final userHasStoreProvider = FutureProvider.family<bool, String>((
  ref,
  userId,
) async {
  final storeRepository = ref.watch(storeRepositoryProvider);
  return await storeRepository.userHasStore(userId);
});
