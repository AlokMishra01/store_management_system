import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifiers/store_form_notifier.dart';
import '../states/store_form_state.dart';
import 'storage_repository_provider.dart';
import 'store_repository_provider.dart';

/// Store form provider
final storeFormProvider =
    StateNotifierProvider<StoreFormNotifier, StoreFormState>(
  (ref) {
    final storeRepository = ref.read(storeRepositoryProvider);
    final storageRepository = ref.read(storageRepositoryProvider);
    return StoreFormNotifier(storeRepository, storageRepository);
  },
);
