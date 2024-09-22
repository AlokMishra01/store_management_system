import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/store_repository.dart';

/// Store repository provider
final storeRepositoryProvider = Provider(
  (ref) => StoreRepository(),
);
