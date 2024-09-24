import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/storage_service.dart';

/// Storage repository provider
final storageRepositoryProvider = Provider(
  (ref) => StorageService(),
);
