// Provider to get store details
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'store_repository_provider.dart';

final storeDetailsProvider =
    FutureProvider.family<Map<String, dynamic>?, String>((
  ref,
  userId,
) async {
  final storeRepository = ref.watch(storeRepositoryProvider);
  return await storeRepository.getStoreDetails(userId);
});
