import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'store_repository_provider.dart';

final storeDetailsProvider = FutureProvider<Map<String, dynamic>?>((ref) async {
  final storeRepository = ref.read(storeRepositoryProvider);
  final response = await storeRepository.getStoreDetails();

  return response;
});
