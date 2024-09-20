import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repositories/store_repository.dart';

// Create a provider for the store repository
final storeRepositoryProvider = Provider(
  (ref) => StoreRepository(),
);
